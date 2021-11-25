# frozen_string_literal: true

FactoryBot.define do
  factory :funny_bot_message do
    user
    body { 'MyString' }
  end
end
