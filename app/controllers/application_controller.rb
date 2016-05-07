class ApplicationController < ActionController::Base
  include Mobylette::RespondToMobileRequests

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_filter :authenticate_user!

  def stored_location_for(resource)
    if resource.events.count > 0
      page = :dashboard
    else
      page = :editor
    end

    app_path(page: page)
  end
end
