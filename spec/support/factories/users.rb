# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "test_user_#{n}" }
    password { 'p@ssw@rd' }
    age { 25 }

    trait :with_favorites do
      favorites do
        [
          build(:favorite_meal),
          build(:favorite_beverage),
          build(:favorite_friendship)
        ]
      end
    end

    trait :with_invalid_favorite do
      favorites do
        [
          build(:favorite, :with_empty_description),
          build(:favorite)
        ]
      end
    end
  end
end
