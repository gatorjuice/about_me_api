# frozen_string_literal: true

module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :authorize_user, only: %i[create]

      def create
        favorite = logged_in_user.favorites.create!(favorite_params)

        render_created(favorite: FavoriteSerializer.new(favorite))
      end

      private

      def favorite_params
        params.require(:favorite).permit(:category, :description)
      end
    end
  end
end
