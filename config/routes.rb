# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#login'

      resources :concerts, only: %i[index show]
      resources :favorites, only: %i[create]
      resources :users, only: %i[show create update]
    end
  end
end
