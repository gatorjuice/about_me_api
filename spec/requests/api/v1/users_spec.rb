# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  include RequestSpecHelper

  let!(:user) { create(:user, password: password) }
  let!(:token) { login_user_for_token(user.username, password) }
  let(:password) { 'p@ssw@rd' }

  describe 'POST#create' do
    subject(:create_user) { post api_v1_users_path, params: params.to_json, headers: headers }

    let(:headers) { { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' } }
    let(:params) do
      {
        user: {
          username: 'jgates',
          password: 'hello',
          age: 20,
          favorites_attributes: favorites_attributes
        }
      }
    end
    let(:favorites_attributes) do
      [
        { category: 'drink', description: 'pepsi' },
        { category: 'snack', description: 'chips' },
        { category: 'relationship', description: 'cousin bob' }
      ]
    end

    context 'when user is signed in' do
      it 'creates a new user in the database' do
        expect { create_user }.to change(User, :count).by(1)
      end

      it 'creates favorites for the new user in the database' do
        expect { create_user }.to change(Favorite, :count).by(3)
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

    context 'when favorites_attributes are not valid' do
      let(:favorites_attributes) do
        [
          { category: 'horses', description: 'pepsi' },
          { category: 'snack' }
        ]
      end

      it 'does not create a new user in the database' do
        expect { create_user }.not_to(change(User, :count))
      end

      it 'does not create a new favorites in the database' do
        expect { create_user }.not_to(change(Favorite, :count))
      end

      it 'returns an error message' do
        create_user
        expect(errors).to eq('message' => ["'horses' is not a valid category"])
      end
    end
  end
end
