# frozen_string_literal: true

module Concerts
  # Saves concert to the database
  class CreateJob < ApplicationJob
    def perform(concert)
      Concert.create!(concert)
    end
  end
end
