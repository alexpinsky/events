class Admin::EventsController < ApplicationController

  def index
    @events = Event.includes(:template, :user).with_user.order('created_at desc')
  end

  def publish
    @event = Event.find params[:id]

    if @event.update_attribute :state, Event::STATES[:published]
      redirect_to admin_events_path, notice: 'The event is public now!'
    else
      render :index, alert: @event.errors.full_messages.join(', ')
    end
  end

  def unpublish
    @event = Event.find params[:id]

    if @event.update_attributes state: Event::STATES[:unpublished], url: nil
      redirect_to admin_events_path, notice: 'The event is private now!'
    else
      render :index, alert: @event.errors.full_messages.join(', ')
    end
  end
end