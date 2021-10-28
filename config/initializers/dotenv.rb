# frozen_string_literal: true

Dotenv.require_keys(
  'SENTRY_DSN',
  'SIDEKIQ_USERNAME',
  'SIDEKIQ_PASSWORD',
  'TICKETMASTER_API_KEY'
)
