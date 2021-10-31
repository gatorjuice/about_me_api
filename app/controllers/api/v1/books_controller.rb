# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      def index
        render json: Book.all.includes(:users).map do |book|
          BookSerializer.new(book, user: User.last)
        end
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
