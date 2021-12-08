# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    user
    title { 'MyString' }
    details { 'MyText' }
    due_at { 1.day.from_now }
    completed_at { nil }

    trait :complete do
      completed_at { 1.second.ago }
    end

    trait :overdue do
      due_at { 1.second.ago }
    end
  end
end
