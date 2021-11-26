# frozen_string_literal: true

# An indiviual band's show in an event at a venue.
# A band has many concerts, as does a venue.
class Concert < ApplicationRecord
  validates :band, :source_id, presence: true
  validates :source_id, uniqueness: {
    scope: :band,
    message: 'Band at event is a duplicate, skipping creation.'
  }

  def venue_name
    venues.dig(0, 'name')
  end
end
