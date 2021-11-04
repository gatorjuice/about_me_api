# frozen_string_literal: true

module GithubRepos
  # Compiles results from concert APIs and asynchronously calls a procedure to
  # update or add them to the DB.
  class Index
    include Interactor

    def call
      context.github_repos = repo_promises.map(&:value!).flatten.select(&:repo_data)
    end

    private

    def repo_promises
      repos.map do |repo|
        Concurrent::Promise.execute do
          repo.fetch_repo_data!
          repo
        end
      rescue StandardError => e
        context.errors = e.full_messages
      end
    end

    def repos
      if context.params[:category]
        GithubRepo.public_send(context.params[:category])
      else
        GithubRepo.all
      end
    end
  end
end
