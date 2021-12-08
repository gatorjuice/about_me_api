# frozen_string_literal: true

class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :details
      t.datetime :due_at
      t.datetime :completed_at

      t.timestamps
    end

    add_index :todos, :completed_at
    add_index :todos, :due_at
    add_index :todos, :user_id
  end
end
