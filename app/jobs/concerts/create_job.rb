# frozen_string_literal: true

module Concerts
  class CreateJob < ApplicationJob
    queue_as :default

    def perform(concerts)
      concerts.map do |concert|
        Concert.create!(concert)
      rescue StandardError => e
        Sidekiq.logger.info(e)
      end
    end
  end
end
