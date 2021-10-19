# frozen_string_literal: true

require 'sidekiq/web'

# Configure Sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_interslice_session'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  secure_compare(username, ENV['SIDEKIQ_USERNAME']) &
    secure_compare(password, ENV['SIDEKIQ_PASSWORD'])
end

def secure_compare(supplied_string, comparison_string)
  ActiveSupport::SecurityUtils.secure_compare(supplied_string, comparison_string)
end
