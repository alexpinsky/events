class CategoriesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @templates = Template.includes(:category).group_by(&:category_name)
  end
end