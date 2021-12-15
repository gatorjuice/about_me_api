# frozen_string_literal: true

# GithubRepo Serializer
class GithubRepoSerializer < BaseSerializer
  attributes :id,
             :name,
             :full_name,
             :category,
             :forks_count,
             :stargazers_count,
             :watchers_count,
             :popularity_rating
end
