# frozen_string_literal: true

# Creates Favorites under the logged in user
class CreateFavorite
  include Interactor

  def call
    context.favorite = context.logged_in_user.favorites.create!(
      category: context.category,
      description: context.description
    )
  rescue ActiveRecord::RecordInvalid, ArgumentError => e
    context.fail!(message: [e.message])
  end
end
