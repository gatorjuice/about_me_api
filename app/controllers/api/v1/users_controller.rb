# frozen_string_literal: true

module Api
  module V1
    # Users Controller
    class UsersController < ApplicationController
      before_action :authorize_user, only: [:show]

      def show
        render_success(serialized_user_with_token(logged_in_user))
      end

      def create
        result = CreateUser.call(user_params: user_params)

        if result.success?
          render_created(serialized_user_with_token(result.user))
        else
          render_error(message: result.message)
        end
      end

      private

      def user_params
        params.require(:user).permit(
          :username,
          :password,
          :age,
          favorites_attributes: %i[category description]
        )
      end
    end
  end
end
