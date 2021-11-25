# frozen_string_literal: true

# Sends text messages using the Twilio API
class TwilioTextMessenger
  def self.call(phone_number:, funny_bot_message:)
    client = Twilio::REST::Client.new

    client.messages.create(
      from: ENV.fetch('TWILIO_FROM_PHONE_NUMBER'),
      to: phone_number,
      body: funny_bot_message.body
    )
  end
end
