# frozen_string_literal: true

module Api
  module V1
    # Favorites Controller
    class FavoritesController < ApplicationController
      before_action :authorize_user

      def create
        result = Favorites::Create.call(
          favorite_params: favorite_params,
          user: logged_in_user
        )

        if result.success?
          render_created(favorite: FavoriteSerializer.new(result.favorite))
        else
          render_error(result.message)
        end
      end

      private

      def favorite_params
        params.require(:favorite).permit(:category, :description)
      end
    end
  end
end
