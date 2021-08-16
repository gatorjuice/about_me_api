# frozen_string_literal: true

class Favorite < ApplicationRecord
  enum category: { drink: 0, snack: 10, relationship: 20 }

  validates :category, :description, presence: true

  belongs_to :user
end
