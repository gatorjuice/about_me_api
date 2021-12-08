# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.0.0'

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'concurrent-ruby', '~> 1.1.9'
gem 'dotenv-rails'
gem 'faraday', '~> 1.5.1'
gem 'graphql', '~> 1.13.0'
gem 'interactor-rails', '~> 2.0'
gem 'jwt', '~> 2.2.3'
gem 'nokogiri'
gem 'open-uri'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.5'
gem 'rack-cors', '~> 1.1.1'
gem 'rails', '~> 6.1.4.1'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'sentry-sidekiq'
gem 'sidekiq'
gem 'twilio-ruby', '~> 5.61.1'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
end

group :test do
  gem 'fakeredis', require: 'fakeredis/rspec'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
