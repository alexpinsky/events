require 'action_view/helpers/javascript_helper'

class EventsController < ApplicationController
  include ActionView::Helpers::JavaScriptHelper
  skip_before_filter :authenticate_user!, only: [:show]

  def index
    @events = current_user.events
    @event = Event.new
  end

  def show
    id = params[:id].to_i
    @preview = params[:preview].present? ? true : false
    if id == 0
      @event = Event.find_by_url params[:id]
    else
      @event = Event.find id
    end
    render layout: "display"
  end

  def new
    category = Category.find params[:category_id]
    theme = category.events.themes.find params[:theme_id]
    @event = Event.copy_from_theme(
      category: category, 
      theme: theme, 
      user: current_user
    )
    @categories = Category.includes(:events).where('events.is_theme = ?', true).references(:events)
  end

  def create
    @event = current_user.events.new(event_params.merge({is_theme: false}))
    if @event.save
      redirect_to events_path
      flash[:success] = "Event was successfully created"
    else
      error_msg = escape_javascript("Failed to create the Event.\n#{@event.errors.full_messages.join('\n,')}")
      @categories = Category.includes(:events).where('events.is_theme = ?', true).references(:events)
      flash[:alert] = error_msg
      render :new
    end
  end
  
  def edit
    @event = current_user.events.includes(:pictures, :appearance, :information).find(params[:id])
    Event.update_from_theme(
      event: @event,
      theme: Event.themes.find_by_id(params[:theme_id])
    )
    @categories = Category.includes(:events).where('events.is_theme = ?', true).references(:events)
  end

  def update
    @event = current_user.events.find params[:id]
    if @event.update_attributes(event_params)
      redirect_to events_path
      flash[:success] = "Event was successfully updated"
    else
      error_msg = escape_javascript("Failed to update the Event.\n#{@event.errors.full_messages.join('\n,')}")
      @categories = Category.includes(:events).where('events.is_theme = ?', true).references(:events)
      flash[:alert] = error_msg
      render :edit
    end
  end

  def destroy
    @event = current_user.events.find params[:id]
    if @event.destroy
      flash[:success] = "Event was successfully deleted"
    else
      flash[:alert] = @event.errors.full_messages
    end
    redirect_to events_path
  end

  def reload_preview
    @event = current_user.events.includes(:pictures, :appearance, :information, :song).find params[:id]
  end

  def publish
    # event make public and other stuff
    @event = current_user.events.find(params[:id])
    redirect_to new_event_post_path(@event)
  end

private

  def event_params
    sanitaized_params.require(:event).permit(:id, :theme_id, :category_id, :text_1, :text_2, :text_3, pictures_attributes: [:id, :image, :order, :slideshow], appearance_attributes: [:id, :font_family_1, :font_color_1, :font_size_1, :font_family_2, :font_color_2, :font_size_2, :font_family_3, :font_color_3, :font_size_3, :background_image], information_attributes: [:id, :summary, :location, :organizer, :organizer_email, :time_zone, :start_time, :end_time])
  end

  def sanitaized_params
    params[:event][:pictures_attributes].delete_if { |key, value| value[:image].blank? }
    params
  end

  def set_page_name
    @page_name = 'editor'    
  end
end
