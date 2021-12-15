# frozen_string_literal: true

class CreateStateAbbreviations < ActiveRecord::Migration[6.1]
  def change
    create_table :state_abbreviations do |t|
      t.string :name, null: false
      t.string :abbrev, null: false
      t.string :code, null: false

      t.timestamps
    end

    add_index :state_abbreviations, %i[name abbrev code], unique: true
  end
end
