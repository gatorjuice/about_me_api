# frozen_string_literal: true

module Concerts
  class Index
    include Interactor

    def call
      context.concerts = all_concerts
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
