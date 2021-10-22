# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Movies', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get api_v1_movie_path

      expect(response).to have_http_status(:success)
    end
  end
end
