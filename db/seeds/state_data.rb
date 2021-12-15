# frozen_string_literal: true

require 'csv'

StateAbbreviation.delete_all
StateDatum.delete_all

def read_csv(file)
  CSV.read(
    Rails.root.join('db/seeds/csv_data', file),
    headers: true,
    header_converters: %i[downcase symbol]
  )
end

read_csv('state_abbreviations.csv').each do |row|
  StateAbbreviation.create!(name: row[:state], abbrev: row[:abbrev], code: row[:code])
end

read_csv('state_data.csv').each do |row|
  StateDatum.create!(
    state_name: row[:state],
    median_household_income: row[:median_household_income],
    share_unemployed_seasonal: row[:share_unemployed_seasonal],
    share_population_in_metro_areas: row[:share_population_in_metro_areas],
    share_population_with_high_school_degree: row[:share_population_with_high_school_degree]
  )
end
