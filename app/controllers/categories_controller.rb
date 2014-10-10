class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:events).where('events.is_theme = ?', true)
  end
  
end