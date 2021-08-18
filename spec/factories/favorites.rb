# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    user
    category { :beverage }
    description { 'Water' }

    trait :with_empty_description do
      description { '' }
    end
  end
end
