# frozen_string_literal: true

module Api
  module V1
    # FunnyBotMessages Controller
    class FunnyBotMessagesController < ApplicationController
      FUNNY_BOT_USERNAME = 'funny_bot@about_me_api.com'

      def create
        FunnyBotMessage.create(
          user: funny_bot_user,
          body: params['Body'],
          created_by_funny_bot: true
        )
        render xml: {}.to_xml(root: 'Response')
      end

      private

      def funny_bot_user
        User.find_by!(username: FUNNY_BOT_USERNAME)
      end
    end
  end
end
