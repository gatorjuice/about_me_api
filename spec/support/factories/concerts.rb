# frozen_string_literal: true

FactoryBot.define do
  factory :concert do
    source_id { 'MyString' }
    band { 'MyString' }
    date_time { '2021-10-17 11:52:36' }
    dates { '' }
    sales { '' }
    price_ranges { '' }
    venues { [{ 'name' => 'The Empty Bottle' }] }
  end
end
