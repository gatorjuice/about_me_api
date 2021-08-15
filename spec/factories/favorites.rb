# frozen_string_literal: true

FactoryBot.define do
  factory :favorite do
    user_id { 1 }
    category { 1 }
    description { 'MyString' }
  end
end
