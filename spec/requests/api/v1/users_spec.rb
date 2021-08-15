# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  include RequestSpecHelper

  let!(:user) { create(:user, password: password) }
  let(:password) { 'p@ssw@rd' }
  let(:params) { { username: 'jgates', password: 'hello', age: 20 } }
  let(:headers) { { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' } }

  describe 'POST#create' do
    let(:create_user) { post api_v1_users_path, params: params.to_json, headers: headers }

    context 'when user is signed in' do
      let!(:token) { login_user_for_token(user.username, password) }

      it 'returns the newly created user and token' do
        expect { create_user }.to change { User.count }.by(1)
        expect(parsed_response['user']).to include('username' => 'jgates')
        expect(parsed_response['token']).to be_a_kind_of(String)
      end
    end

    context 'when user is not signed in' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      it 'returns an error message' do
        expect { create_user }.to_not(change { User.count })
        expect(parsed_response).to eq('message' => 'Please log in')
      end
    end
  end
end
