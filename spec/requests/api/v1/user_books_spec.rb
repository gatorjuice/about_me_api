# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::UserBooks', type: :request do
  describe 'GET /create' do
    it 'returns http success' do
      post api_v1_user_books_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      delete api_v1_user_book_path(1)
      expect(response).to have_http_status(:success)
    end
  end
end
