# frozen_string_literal: true

module Api
  module V1
    # FunnyBotMessages Controller
    class FunnyBotMessagesController < ApplicationController
      before_action :authorize_user

      def create
        render_success(FunnyBotMessage.create!(funny_bot_message_params))
      end

      private

      def funny_bot_message_params
        params.permit(:user_id, :body)
      end
    end
  end
end
