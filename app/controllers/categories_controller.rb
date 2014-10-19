class CategoriesController < ApplicationController

  def index
    @categories = Category.includes(:events).where('events.is_theme = ?', true)
  end
  
private

  def set_page_name
    @page_name = 'templates'
  end
end