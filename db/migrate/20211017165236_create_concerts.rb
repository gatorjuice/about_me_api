# frozen_string_literal: true

class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.integer :venue_id
      t.string :source_id
      t.string :band
      t.datetime :date_time
      t.jsonb :dates
      t.jsonb :sales
      t.jsonb :price_ranges

      t.timestamps
    end
  end
end
