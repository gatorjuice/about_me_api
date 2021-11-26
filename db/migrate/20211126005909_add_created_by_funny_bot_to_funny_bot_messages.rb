# frozen_string_literal: true

class AddCreatedByFunnyBotToFunnyBotMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :funny_bot_messages, :created_by_funny_bot, :boolean, default: false
  end
end
