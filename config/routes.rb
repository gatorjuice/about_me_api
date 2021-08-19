# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#login'

      resources :users, only: %i[show create update]
      resources :favorites, only: %i[create]
    end
  end
end
