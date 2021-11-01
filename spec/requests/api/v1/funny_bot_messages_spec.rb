# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::FunnyBotMessages', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      post api_v1_funny_bot_messages_path
      expect(response).to have_http_status(:success)
    end
  end
end
