# frozen_string_literal: true

class CreateStateData < ActiveRecord::Migration[6.1]
  def change
    create_table :state_data do |t|
      t.string :state_name
      t.integer :median_household_income
      t.decimal :share_unemployed_seasonal, precision: 4, scale: 3
      t.decimal :share_population_in_metro_areas, precision: 4, scale: 3
      t.decimal :share_population_with_high_school_degree, precision: 4, scale: 3

      t.timestamps
    end

    add_index :state_data, :state_name, unique: true
  end
end
