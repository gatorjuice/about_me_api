# frozen_string_literal: true

# Essentially a message just namespaced to funny bot world
class FunnyBotMessage < ApplicationRecord
  after_create :broadcast_messages

  belongs_to :user

  validates :body, length: { maximum: 160 }

  def broadcast_messages
    ActionCable.server.broadcast('funny_bot_channel', { funnyBotMessages: self.class.order(:created_at) })
  end
end
