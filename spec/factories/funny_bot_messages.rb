# frozen_string_literal: true

FactoryBot.define do
  factory :funny_bot_message do
    user_id { 1 }
    body { 'MyString' }
  end
end
