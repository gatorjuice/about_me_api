# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attribute :user_favorite?, key: :is_favorite
  attributes :id, :title, :author, :page_count, :img_url

  def user_favorite?
    binding.pry
    object.user_favorite?(current_user)
  end
end
