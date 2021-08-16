# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  include RequestSpecHelper

  let!(:user) { create(:user, password: password) }
  let(:password) { 'p@ssw@rd' }
  let(:params) { { username: 'jgates', password: 'hello', age: 20 } }

  describe 'POST#create' do
    let(:create_user) { post api_v1_users_path, params: params.to_json, headers: headers }

    context 'when user is signed in' do
      let!(:token) { login_user_for_token(user.username, password) }
      let(:headers) { { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' } }

      it 'creates a new user in the database' do
        expect { create_user }.to change(User, :count).by(1)
      end

      it 'returns the new user' do
        create_user

        expect(data['user']).to include('username' => 'jgates')
      end

      it 'returns the token' do
        create_user

        expect(data['token']).to be_a_kind_of(String)
      end
    end

    context 'when user is not signed in' do
      let(:headers) { { 'Content-Type' => 'application/json' } }

      it 'does not create a new user in the database' do
        expect { create_user }.not_to(change(User, :count))
      end

      it 'returns an error message' do
        create_user

        expect(errors).to eq('message' => 'Please log in')
      end
    end
  end
end
