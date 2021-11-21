# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :box_office_mojo_id
      t.string :title
      t.text :summary
      t.jsonb :performance
      t.jsonb :crew
      t.jsonb :cast
      t.jsonb :misc
      t.text :image

      t.timestamps
    end

    add_index :movies, :box_office_mojo_id, unique: true
  end
end
