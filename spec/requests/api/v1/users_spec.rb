# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  include RequestSpecHelper

  let!(:user) { create(:user, :with_favorites, username: username, password: password) }
  let(:username) { 'test_user_1' }
  let(:password) { 'p@ssw@rd' }
  let(:user_id) { user.id }
  let(:json_header) { { 'Content-Type' => 'application/json' } }
  let(:headers) { json_header.merge('Authorization' => "Bearer #{token}") }
  let!(:token) { login_user_for_token(user.username, password) }

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
      { category: 'beverage', description: 'pepsi' },
      { category: 'meal', description: 'chips' },
      { category: 'friendship', description: 'cousin bob' }
    ]
  end

  describe 'GET#show' do
    subject(:show_user) do
      get api_v1_user_path(user_id), headers: headers
    end

    before { show_user }

    context 'when signed in' do
      let(:expected_data) do
        {
          'token' => a_kind_of(String),
          'user' => {
            'username' => user.username,
            'age' => user.age,
            'favorites' => [
              { 'category' => 'meal', 'description' => 'Sandwich' },
              { 'category' => 'beverage', 'description' => 'Water' },
              { 'category' => 'friendship', 'description' => 'Bob' }
            ]
          }
        }
      end

      it 'returns the user' do
        expect(data).to include(expected_data)
      end
    end

    context 'when not signed in' do
      let(:user_id) { 1 }
      let(:headers) { json_header }
      let(:expected_errors) { { 'message' => 'Please log in' } }

      it 'returns an error' do
        expect(errors).to eq(expected_errors)
      end

      it 'does not return data' do
        expect(data).to be_nil
      end
    end

    context 'when attempting to access a different user by params' do
      let!(:token) { login_user_for_token(user.username, password) }
      let(:headers) { json_header.merge('Authorization' => "Bearer #{token}") }
      let(:user_id) { user.id + 1 }

      it 'returns the user defined by the JWT' do
        expect(data.dig('user', 'username')).to eq(user.username)
      end
    end
  end

  describe 'POST#create' do
    subject(:create_user) do
      post api_v1_users_path, params: params.to_json, headers: json_header
    end

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

    context 'when favorites_attributes are not valid' do
      let(:favorites_attributes) do
        [
          { category: 'horses', description: 'pepsi' },
          { category: 'meal' }
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

  describe 'PATCH#update' do
    subject(:update_user) do
      patch "/api/v1/users/#{user.id}", params: params.to_json, headers: headers
    end

    let(:expected_username) { 'jgates' }
    let(:expected_age) { 20 }
    let(:expected_favorites) do
      [
        { 'category' => 'meal', 'description' => 'chips' },
        { 'category' => 'beverage', 'description' => 'pepsi' },
        { 'category' => 'friendship', 'description' => 'cousin bob' }
      ]
    end

    before { update_user }

    it 'updates the username' do
      expect(data.dig('user', 'username')).to eq(expected_username)
    end

    it 'updates the age' do
      expect(data.dig('user', 'age')).to eq(expected_age)
    end

    it 'updates the favorites' do
      expect(data.dig('user', 'favorites')).to match_array(expected_favorites)
    end
  end
end
