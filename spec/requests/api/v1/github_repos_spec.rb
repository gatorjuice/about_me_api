# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::GithubRepos', type: :request do
  include RequestSpecHelper

  describe 'GET_index', vcr: true do
    let(:expected) do
      [
        {
          'name' => 'vue',
          'full_name' => 'vuejs/vue',
          'category' => 'javascript_framework',
          'forks_count' => 30_574,
          'stargazers_count' => 189_961,
          'watchers_count' => 189_961,
          'popularity_rating' => 391_283
        },
        {
          'name' => 'react',
          'full_name' => 'facebook/react',
          'category' => 'javascript_framework',
          'forks_count' => 35_801,
          'stargazers_count' => 177_187,
          'watchers_count' => 177_187,
          'popularity_rating' => 373_710
        }
      ]
    end

    before do
      create(:github_repo, organization: 'vuejs', project: 'vue')
      create(:github_repo, organization: 'facebook', project: 'react')
      create(:github_repo, :skip_validate, organization: 'non-existent-org', project: 'error')
    end

    it 'returns http success' do
      get api_v1_github_repos_path

      expect(response).to have_http_status(:success)
    end

    it 'returns the correct data' do
      get api_v1_github_repos_path

      expect(data).to match_array(expected)
    end
  end
end
