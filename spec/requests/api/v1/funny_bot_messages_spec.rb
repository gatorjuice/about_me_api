# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::FunnyBotMessages', type: :request do
  include RequestSpecHelper

  let(:headers) { { 'Content-Type' => 'application/json' } }

  before do
    create(:user, username: 'funny_bot@about_me_api.com')
  end

  describe 'POST_create', vcr: true do
    let(:params) do
      {
        'ToCountry' => 'US',
        'ToState' => 'IL',
        'SmsMessageSid' => 'sms_sid',
        'NumMedia' => '0',
        'ToCity' => 'PARIS',
        'FromZip' => '60605',
        'SmsSid' => 'sms_sid',
        'FromState' => 'IL',
        'SmsStatus' => 'received',
        'FromCity' => 'CHICAGO',
        'Body' => 'Hi twilit',
        'FromCountry' => 'US',
        'To' => '+12175551212',
        'MessagingServiceSid' => 'ms_sid',
        'ToZip' => '61933',
        'NumSegments' => '1',
        'MessageSid' => 'sms_sid',
        'AccountSid' => 'account_sid',
        'From' => '+13125551212',
        'ApiVersion' => '2010-04-01'
      }.to_json
    end

    it 'returns http success' do
      post api_v1_funny_bot_messages_path, params: params, headers: headers

      expect(response).to have_http_status(:success)
    end

    it 'returns an empty response xml body' do
      post api_v1_funny_bot_messages_path, params: params, headers: headers

      expect(response.body).to eq(
        "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<Response>\n</Response>\n"
      )
    end

    it 'creates a new message in the database' do
      expect do
        post api_v1_funny_bot_messages_path, params: params, headers: headers
      end.to change(FunnyBotMessage, :count).by(1)
    end
  end
end
