class EventsController < ApplicationController

  def show
    @event = if params[:url]
      Event.includes(:template).by_url(params[:url]).first
    else
      Event.includes(:template).by_id(params[:id]).first
    end

    if @event
      render layout: false
    else
      redirect_to root_path
    end
  end
end
