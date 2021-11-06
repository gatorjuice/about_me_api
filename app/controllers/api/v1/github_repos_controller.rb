# frozen_string_literal: true

module Api
  module V1
    # GithubRepos Controller
    class GithubReposController < ApplicationController
      def index
        result = GithubRepos::Index.call(params: index_params)

        if result.success?
          render_success(result.github_repos.map { |repo| GithubRepoSerializer.new(repo) })
        else
          render_error(result.errors)
        end
      end

      def categories
        categories_hashes = GithubRepo.categories.map do |key, _|
          {
            category: key,
            formatted_category: key.titleize
          }
        end
        render_success(categories_hashes)
      end

      private

      def index_params
        params.permit(:category)
      end
    end
  end
end
