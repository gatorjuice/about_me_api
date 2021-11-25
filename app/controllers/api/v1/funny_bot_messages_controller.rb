# frozen_string_literal: true

module Api
  module V1
    # FunnyBotMessages Controller
    class FunnyBotMessagesController < ApplicationController
      def create
        Rails.logger.info(params)
        FunnyBotMessage.create(user: User.last, body: params['Body'])
        render_success({})
      end
    end
  end
end
