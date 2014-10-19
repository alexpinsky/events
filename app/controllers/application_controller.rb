class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :set_page_name

  def stored_location_for(resource)
    events_path
  end

private

  def set_page_name
    @page_name = nil    
  end
end
