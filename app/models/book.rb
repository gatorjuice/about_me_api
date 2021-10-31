# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books

  def user_favorite?(user)
    users.include?(user)
  end
end
