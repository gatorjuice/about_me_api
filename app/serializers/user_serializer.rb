# frozen_string_literal: true

# User Serializer
class UserSerializer < BaseSerializer
  has_many :favorites

  attributes :username, :age, :favorites
end
