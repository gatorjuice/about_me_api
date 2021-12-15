# frozen_string_literal: true

module Api
  module V1
    # States Controller
    class StatesController < ApplicationController
      def index
        render_success(StateDatum.all.map { |state| StateDatumSerializer.new(state) })
      end

      def show; end
    end
  end
end
