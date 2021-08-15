# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show, :create]
      resources :favorites, only: %i[index create]
      post '/login', to: 'users#login'
      get '/auto_login', to: 'users#auto_login'
    end
  end
end
