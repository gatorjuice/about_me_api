# frozen_string_literal: true

class AddUniqueIndexToConcerts < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        change_table :concerts, bulk: true do |t|
          t.remove :venue_id
          t.jsonb :venues
        end
      end

      dir.down do
        change_table :concerts, bulk: true do |t|
          t.remove :venues
          t.jsonb :venue_id
        end
      end
    end

    add_index :concerts, %i[band source_id], unique: true
  end
end
