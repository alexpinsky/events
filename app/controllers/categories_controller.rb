class CategoriesController < ApplicationController

  def index
    @categories = Category.with_themes
  end
end