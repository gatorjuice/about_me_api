# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FunnyBotChannel, type: :channel do
  describe '#post_message' do
    context 'when Funny Bot was the last to create a message' do
      before do
        create(:funny_bot_message, :from_funny_bot)
        subscribe
        allow(TwilioTextMessenger).to receive(:call)
      end

      it 'creates a FunnyBotMessage' do
        expect do
          perform :post_message, message: 'hello there'
        end.to change(FunnyBotMessage, :count).by(1)
      end

      it 'calls twilio messagenger' do
        perform :post_message, message: 'hello there'

        expect(TwilioTextMessenger).to have_received(:call).with(
          phone_number: '+13125551212',
          funny_bot_message: a_kind_of(FunnyBotMessage)
        )
      end
    end

    context 'when any other user was the last to create a message' do
      before do
        create(:funny_bot_message)
        subscribe
        allow(TwilioTextMessenger).to receive(:call)
      end

      it 'does not create a FunnyBotMessage' do
        expect do
          perform :post_message, message: 'hello there'
        end.not_to change(FunnyBotMessage, :count)
      end

      it 'does not call the Twilio service' do
        perform :post_message, message: 'hello there'

        expect(TwilioTextMessenger).not_to have_received(:call)
      end
    end
  end
end
