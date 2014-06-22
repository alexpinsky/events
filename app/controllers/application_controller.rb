class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  def stored_location_for(resource)
    user_events_path(resource)
  end

  def set_user
    @user = current_user
  end
end
