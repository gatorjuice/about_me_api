# frozen_string_literal: true

class Movie < ApplicationRecord
  validates :box_office_mojo_id,
            :title,
            :summary,
            :performance,
            :crew,
            :cast,
            :misc,
            :image,
            presence: true
end
