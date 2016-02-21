module Api
  module V1
    class CategoriesController < ApplicationController

      def index
        render json: Category.decorate.with_themes
      end
    end
  end
end
