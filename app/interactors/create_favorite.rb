# frozen_string_literal: true

# Creates Favorites under the logged in user
class CreateFavorite
  include Interactor

  def call
    context.favorite = context.user.favorites.create!(
      category: context.favorite_params[:category],
      description: context.favorite_params[:description]
    )
  rescue ActiveRecord::RecordInvalid, ArgumentError => e
    context.fail!(message: [e.message])
  end
end
