class Admin::EventsController < ApplicationController

  def index
    @events = Event.includes(:theme).with_url
  end
end