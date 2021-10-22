# frozen_string_literal: true

module Api
  module V1
    # Movies Controller
    class MoviesController < ApplicationController
      def show
        result = Movies::Show.call(movie_params: params.permit(:title, :year))

        result.success? ? render_success(result.movie) : render_error(result.error)
      end
    end
  end
end
