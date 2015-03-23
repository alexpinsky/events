class CategoriesController < ApplicationController

  def index
    # {'wedding' => [event, event..], 'meetups' => [event, event,...], ...}    
    @templates = Event.themes.include_categories.group_by(&:category_name)
    prepend_placeholder_templates @templates
  end

private
  
  def prepend_placeholder_templates(templates)
    mock_template = Event.new
    templates.merge!(
      'celebration' => [mock_template, mock_template, mock_template, mock_template],
      'meetups' => [mock_template, mock_template, mock_template, mock_template],
      'whatever' => [mock_template, mock_template, mock_template, mock_template]
    )
  end
end