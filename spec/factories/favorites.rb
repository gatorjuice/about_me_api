# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    user
    category { :drink }
    description { 'Water' }
  end
end
