# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authorized, only: %i[create auto_login]

      # REGISTER
      def create
        @user = User.create(user_params)
        if @user.save
          token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), token: token }
        else
          render json: { error: 'Invalid username or password' }
        end
      end

      # LOGGING IN
      def login
        @user = User.find_by(username: params[:username])

        if @user&.authenticate(params[:password])
          token = encode_token({ user_id: @user.id })
          render json: { user: UserSerializer.new(@user), token: token }
        else
          render json: { error: 'Invalid username or password' }
        end
      end

      def auto_login
        render json: @user
      end

      private

      def user_params
        params.permit(:username, :password, :age)
      end
    end
  end
end
