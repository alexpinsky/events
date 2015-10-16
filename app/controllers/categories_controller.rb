class CategoriesController < ApplicationController

  def index
    # {'wedding' => [event, event..], 'meetups' => [event, event,...], ...}
    @templates = Event.themes.active.include_categories.group_by(&:category_name)
  end
end