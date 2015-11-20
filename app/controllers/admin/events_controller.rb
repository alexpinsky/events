class Admin::EventsController < ApplicationController

  def index
    @events = Event.includes(:theme, :user).with_user.order('created_at desc')
  end
end