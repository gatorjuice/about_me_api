# frozen_string_literal: true

# Websocket Channel for FunnyBot
class FunnyBotChannel < ApplicationCable::Channel
  CHANNEL = 'funny_bot_channel'

  def subscribed
    stream_from CHANNEL
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def all_messages
    messages = FunnyBotMessage.order(:created_at)

    ActionCable.server.broadcast(CHANNEL, { funnyBotMessages: messages })
  end

  def post_message(data)
    return unless FunnyBotMessage.last.created_by_funny_bot

    TwilioTextMessenger.call(
      phone_number: ENV['TWILIO_PHONE_NUMBER'],
      funny_bot_message: FunnyBotMessage.create!(user: User.last, body: data['message'])
    )
  end
end
