# frozen_string_literal: true

module Api
  module V1
    # Todos Controller
    class TodosController < ApplicationController
      before_action :authorize_user

      def index
        render_success(logged_in_user.todos)
      end

      def create; end

      def update; end

      def destroy; end
    end
  end
end
