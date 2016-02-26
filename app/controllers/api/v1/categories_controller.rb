module Api
  module V1
    class CategoriesController < ApplicationController

      def index
        presenters = Category.includes(:templates).map do |category|
          CategoryPresenter.new category
        end

        render json: presenters
      end
    end
  end
end
