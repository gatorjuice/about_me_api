# frozen_string_literal: true

module Api
  module V1
    # Controller for Concerts API
    class ConcertsController < ApplicationController
      before_action :authorize_user

      def index
        result = Concerts::Index.call(
          concert_params: params.permit(:zip_code, :bust_cache)
        )

        render_success(result.concerts, :ok) if result.success?
      end

      def show; end
    end
  end
end
