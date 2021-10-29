# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        render json: Book.all, each_serializer: BookSerializer
      end

      def show; end

      def create
        render_success({})
      end

      def update; end

      def destroy
        render_success({})
      end
    end
  end
end
