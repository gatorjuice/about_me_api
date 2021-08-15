# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, :password_digest, :age, presence: true
  validates :username, uniqueness: true

  has_many :favorites, dependent: :destroy
end
