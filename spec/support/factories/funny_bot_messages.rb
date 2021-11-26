# frozen_string_literal: true

FactoryBot.define do
  factory :funny_bot_message do
    user
    body { 'MyString' }

    trait :from_funny_bot do
      user { create(:user, username: 'funny_bot@about_me_api.com') }
      created_by_funny_bot { true }
    end
  end
end
