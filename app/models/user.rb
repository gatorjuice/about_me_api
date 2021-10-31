# frozen_string_literal: true

# User class
class User < ApplicationRecord
  has_secure_password

  validates :username, :password_digest, :age, presence: true
  validates :username, uniqueness: true
  validates :age, numericality: { only_integer: true }

  has_many :user_books, dependent: :destroy
  has_many :books, through: :user_books
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :favorites
  validates_associated :favorites

  after_update :destroy_conflicting_favorites

  MAX_ALLOWED_FAVORITES = 1

  def destroy_conflicting_favorites
    Favorite.categories.each_key do |category|
      until favorites.public_send(category).count <= MAX_ALLOWED_FAVORITES
        favorites.public_send(category).min.destroy
        favorites.reload
      end
    end
  end
end
