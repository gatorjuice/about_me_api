# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  has_many :favorites

  attributes :username, :age, :favorites
end
