# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Favorites', type: :request do
  include RequestSpecHelper

  let!(:user) { create(:user, password: password) }

  let(:password) { 'p@ssw@rd' }
  let(:headers) { { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' } }
  let(:token) { login_user_for_token(user.username, password) }

  describe 'GET#create' do
    subject(:create_favorite) do
      post api_v1_favorites_path, params: params.to_json, headers: headers
    end

    context 'when successful' do
      let(:params) { { favorite: attributes_for(:favorite) } }

      it 'returns http success' do
        create_favorite
        expect(response).to have_http_status(:created)
      end

      it 'returns the newly created favorite' do
        create_favorite
        expect(data).to eq('favorite' => { 'category' => 'beverage', 'description' => 'Water' })
      end

      it 'adds a favorite for the logged in user' do
        expect { create_favorite }.to change(user.favorites, :count).by(1)
      end
    end

    context 'when failure' do
      let(:params) { { favorite: { category: 'horse', description: 'tiny pony' } } }

      it 'returns http bad_request' do
        create_favorite
        expect(response).to have_http_status(:bad_request)
      end

      it 'returns the error description' do
        create_favorite
        expect(errors).to eq(["'horse' is not a valid category"])
      end

      it 'does not add a favorite for the logged in user' do
        expect { create_favorite }.not_to change(user.favorites, :count)
      end
    end
  end
end
