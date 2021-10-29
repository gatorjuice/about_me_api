# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :page_count, :img_url, :is_favorite

  def is_favorite
    true
  end
end
