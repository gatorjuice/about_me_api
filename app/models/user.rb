# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :username, :password_digest, :age, presence: true
  validates :username, uniqueness: true
  validates :age, numericality: { only_integer: true }

  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :favorites
  validates_associated :favorites
end
