# frozen_string_literal: true

module Api
  module V1
    # Sessions Controller
    class SessionsController < ApplicationController
      def login
        user = User.find_by(username: params.require(:username))

        if user&.authenticate(params.require(:password))
          token = encode_token(user_id: user.id)
          render_success(user: UserSerializer.new(user), token: token)
        else
          render_unauthorized(error: 'Invalid username or password')
        end
      end
    end
  end
end
