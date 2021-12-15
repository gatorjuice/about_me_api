# frozen_string_literal: true

# Base Serializer
class BaseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
end
