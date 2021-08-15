# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :username, :age
end
