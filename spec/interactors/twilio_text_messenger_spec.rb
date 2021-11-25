# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TwilioTextMessenger, type: :interactor do
  subject(:context) do
    described_class.call(
      phone_number: '+13125551212',
      funny_bot_message: create(:funny_bot_message)
    )
  end

  let(:twilio_client_instance) { instance_double(Twilio::REST::Client) }
  let(:twilio_messages) { instance_double(Twilio::REST::Api::V2010::AccountContext::MessageList) }

  before do
    allow(Twilio::REST::Client).to receive(:new).and_return(twilio_client_instance)
    allow(twilio_client_instance).to receive(:messages).and_return(twilio_messages)
    allow(twilio_messages).to receive(:create)
    context
  end

  describe '.call' do
    it 'sends the message to the phone number' do
      expect(twilio_messages).to have_received(:create).with(
        body: 'MyString',
        messaging_service_sid: a_kind_of(String),
        to: '+13125551212'
      )
    end
  end
end
