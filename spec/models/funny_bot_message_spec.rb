# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FunnyBotMessage, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#broadcast_messages' do
    let!(:existing_message) { create(:funny_bot_message) }
    let(:new_message) { create(:funny_bot_message, :from_funny_bot) }

    before { allow(ActionCable.server).to receive(:broadcast) }

    it 'is called after a message is created and broadcasts all messages' do
      new_message

      expect(ActionCable.server).to have_received(:broadcast).with(
        'funny_bot_channel',
        funnyBotMessages: [existing_message, new_message]
      )
    end
  end
end
