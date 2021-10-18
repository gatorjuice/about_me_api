# frozen_string_literal: true

require 'sidekiq/web'

# Configure Sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_interslice_session'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username),
                                              ::Digest::SHA256.hexdigest(ENV['SIDEKIQ_USERNAME'])) &
    ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password),
                                                ::Digest::SHA256.hexdigest(ENV['SIDEKIQ_PASSWORD']))
end
