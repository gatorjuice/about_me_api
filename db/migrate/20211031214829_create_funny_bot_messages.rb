# frozen_string_literal: true

class CreateFunnyBotMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :funny_bot_messages do |t|
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end
end
