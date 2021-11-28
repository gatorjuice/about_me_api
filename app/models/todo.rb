# frozen_string_literal: true

# Todo Item
class Todo < ApplicationRecord
  belongs_to :user

  validates :user, :title, presence: true

  scope :complete, -> { where.not(completed_at: nil) }
  scope :incomplete, -> { where(completed_at: nil) }
  scope :overdue, -> { incomplete.where('due_at < ?', Time.zone.now) }

  def complete!
    update!(completed_at: Time.zone.now)
  end
end
