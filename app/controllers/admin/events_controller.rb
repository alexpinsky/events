class Admin::EventsController < ApplicationController

  def index
    @events = Event.includes(:theme).with_url.order('created_at desc')
  end
end