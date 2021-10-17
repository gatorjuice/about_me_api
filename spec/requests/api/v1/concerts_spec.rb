# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Concerts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get api_v1_concerts_path
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe 'GET /show' do
    it 'returns http success' do
      get api_v1_concert_path
      expect(response).to have_http_status(:success)
    end
  end
end
