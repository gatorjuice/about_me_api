# frozen_string_literal: true

# A Favorite
class Favorite < ApplicationRecord
  enum category: { beverage: 0, meal: 10, friendship: 20 }

  validates :category, :description, presence: true

  belongs_to :user
end
