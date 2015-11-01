class CategoriesController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    # {'wedding' => [event, event..], 'meetups' => [event, event,...], ...}
    @templates = Event.themes.active.include_categories.group_by(&:category_name)
  end
end