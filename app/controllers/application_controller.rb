class ApplicationController < ActionController::Base
  include Mobylette::RespondToMobileRequests

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_filter :_set_page

  def stored_location_for(resource)
    if resource.events.count > 0
      events_path
    else
      new_event_path
    end
  end

  private

  def _set_page
    @page = nil
  end
end
