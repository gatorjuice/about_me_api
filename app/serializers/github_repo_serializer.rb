# frozen_string_literal: true

class GithubRepoSerializer < ActiveModel::Serializer
  attributes :name,
             :full_name,
             :category,
             :forks_count,
             :stargazers_count,
             :watchers_count,
             :popularity_rating
end
