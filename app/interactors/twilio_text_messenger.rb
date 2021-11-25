# frozen_string_literal: true

# Sends text messages using the Twilio API
class TwilioTextMessenger
  def self.call(phone_number:, funny_bot_message:)
    client = Twilio::REST::Client.new

    client.messages.create(
      to: phone_number,
      messaging_service_sid: ENV['TWILIO_MESSAGING_SERVICE_SID'],
      body: funny_bot_message.body
    )
  end
end
