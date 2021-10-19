# frozen_string_literal: true

module Concerts
  # Compiles results from concert APIs and asynchronously calls a procedure to
  # update or add them to the DB.
  class Index
    include Interactor

    def call
      context.concerts = all_concerts

      # Concerts::CreateWorker.perform_async(context.concerts.map(&:attributes))
    end

    private

    def all_concerts
      [ticketmaster_concerts].map(&:value!).flatten
    end

    def ticketmaster_concerts
      Concurrent::Promise.execute do
        TicketmasterApiClient.event_search(context.concert_params)
      end
    end
  end
end
