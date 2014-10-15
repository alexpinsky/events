class CategoriesController < ApplicationController
  before_filter :set_backgroud_image

  def index
    @categories = Category.includes(:events).where('events.is_theme = ?', true)
  end
  
private

  def set_backgroud_image
    @background_image = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/templates/backgrounds/background.jpg'
  end
end