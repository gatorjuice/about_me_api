# frozen_string_literal: true

module Concerts
  # Compiles results from concert APIs and asynchronously calls a procedure to
  # update or add them to the DB.
  class Index
    include Interactor

    def call
      context.concerts = all_concerts

      enqueue_concerts_creation_job(context.concerts)
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

    def enqueue_concerts_creation_job(concerts)
      concerts.each { |concert| Concerts::CreateJob.perform_later(concert) }
    end
  end
end
