# frozen_string_literal: true

module Api
  module V1
    # Books Controller
    class BooksController < ApplicationController
      before_action :authorize_user

      def index
        render json: Book.all, each_serializer: BookSerializer, favorites: logged_in_user.books
      end
    end
  end
end
