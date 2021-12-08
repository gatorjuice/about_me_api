# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"

  mount ActionCable.server => '/cable'
  mount Sidekiq::Web, at: '/sidekiq'

  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#login'

      resources :books, only: [:index]
      resources :concerts, only: %i[index show]
      resources :favorites, only: %i[create]
      resources :funny_bot_messages, only: [:create]
      resources :github_repos, only: [:index]
      resources :movies, only: [:index]
      resources :user_books, only: %i[create destroy]
      resources :users, only: %i[show create update]
      resources :todos, only: %i[index create update destroy]
    end
  end
end
