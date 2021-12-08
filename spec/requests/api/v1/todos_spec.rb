# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Todos', type: :request do
  include RequestSpecHelper

  let!(:user) { create(:user, password: password) }

  let(:password) { 'p@ssw@rd' }
  let(:token) { login_user_for_token(user.username, password) }
  let(:headers) do
    {
      'Authorization' => "Bearer #{token}",
      'Content-Type' => 'application/json'
    }
  end

  describe 'GET /index' do
    before do
      create(:todo)
      create(:todo, user: user)
      create(:todo, user: user)
      get api_v1_todos_path, headers: headers
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns only the logged in users todos' do
      expect(data.all? { |todo| todo['user_id'] == user.id }).to eq(true)
    end
  end
end
