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

  factory :favorite_beverage, class: 'Favorite' do
    user
    category { :beverage }
    description { 'Water' }
  end

  factory :favorite_meal, class: 'Favorite' do
    user
    category { :meal }
    description { 'Sandwich' }
  end

  factory :favorite_friendship, class: 'Favorite' do
    user
    category { :friendship }
    description { 'Bob' }
  end
end
