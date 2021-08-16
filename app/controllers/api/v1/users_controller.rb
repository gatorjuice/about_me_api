# frozen_string_literal: true

module Api
  module V1
    # Users Controller
    class UsersController < ApplicationController
      before_action :authorize_user

      def show
        render_success(
          user: UserSerializer.new(logged_in_user),
          token: encode_token(user_id: logged_in_user.id)
        )
      end

      def create
        result = CreateUser.call(user_params: user_params)

        if result.success?
          render_created(
            user: UserSerializer.new(result.user),
            token: encode_token(user_id: result.user.id)
          )
        else
          render_error(message: result.message)
        end
      end

      private

      def user_params
        params.permit(:username, :password, :age)
      end
    end
  end
end
