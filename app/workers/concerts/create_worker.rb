# frozen_string_literal: true

module Concerts
  # An async worker class responsible attempting to persist concerts for later use.
  class CreateWorker
    include Sidekiq::Worker

    def perform(concerts)
      concerts.map do |concert|
        Concert.create!(concert)
      rescue StandardError => e
        Sidekiq.logger.info(e)
      end
    end
  end
end
