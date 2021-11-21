# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :box_office_mojo_id,
            :title,
            presence: true
end
