FactoryBot.define do
  factory :concert do
    venue_id { 1 }
    source_id { "MyString" }
    band { "MyString" }
    date_time { "2021-10-17 11:52:36" }
    dates { "" }
    sales { "" }
    price_ranges { "" }
  end
end
