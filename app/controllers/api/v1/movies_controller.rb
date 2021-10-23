# frozen_string_literal: true

module Api
  module V1
    # Movies Controller
    class MoviesController < ApplicationController
      def index
        result = Movies::Index.call(search: params.require(:title))

        result.success? ? render_success(result.movies) : render_error(result.error)
      end
    end
  end
end
