# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#login'

      resources :concerts, only: %i[index show]
      resources :favorites, only: %i[create]
      resources :users, only: %i[show create update]
    end
  end
end
