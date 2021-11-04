# frozen_string_literal: true

# User Serializer
class UserSerializer < ActiveModel::Serializer
  has_many :favorites

  attributes :username, :age, :favorites
end
