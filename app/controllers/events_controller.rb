class EventsController < ApplicationController
  skip_before_filter :authenticate_user!

  def show
    @event = if params[:url]
      Event.includes(:template).by_url(params[:url]).first
    else
      Event.includes(:template).by_id(params[:id]).first
    end

    if @event && (@event.template? || @event.viewable_for?(current_user))
      render layout: false
    else
      redirect_to root_path
    end
  end
end
