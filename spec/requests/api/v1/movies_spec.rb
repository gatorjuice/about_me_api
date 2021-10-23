# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Movies', type: :request do
  include RequestSpecHelper

  describe 'GET_index', vcr: true do
    params = { title: 'the+burbs' }

    it 'returns http success' do
      get api_v1_movies_path, params: params

      expect(response).to have_http_status(:success)
    end

    it 'returns an array of movies' do
      get api_v1_movies_path, params: params

      expect(data).to be_a_kind_of(Array)
    end

    it 'returns empty errors' do
      get api_v1_movies_path, params: params

      expect(errors).to be_empty
    end
  end
end
