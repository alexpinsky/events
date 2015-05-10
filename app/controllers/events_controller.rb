require 'action_view/helpers/javascript_helper'

class EventsController < ApplicationController
  include ActionView::Helpers::JavaScriptHelper

  skip_before_filter :authenticate_user!, only: :show

  MESSAGES = {
    update: {
      success: "Event was successfully updated"
    }
  }

  def index
    @events = current_user.events.with_url.includes(:category, :theme, :pictures)
  end

  def show
    @preview = params[:preview].present? ? true : false
    if params[:url]
      @event = Event.includes(
        :category,
        :appearance,
        :information,
        :pictures
      )
      .by_url(params[:url]).first
    else
      @event = Event.includes(
        :category,
        :appearance,
        :information,
        :pictures
      )
      .by_id(params[:id]).first
    end

    if @event
      render layout: "display"
    else
      redirect_to root_path
    end
  end

  def new
    @event = Event.copy_from_theme(theme_for_copy, user: current_user)
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
      respond_to do |format|

        format.html do
          flash[:success] = MESSAGES[:update][:success]
          redirect_to events_path
        end

        format.json do
          render json: { message: MESSAGES[:update][:success] }, status: :ok
        end
      end
    else
      error_msg = escape_javascript(
        "Failed to update the Event.\n#{@event.errors.full_messages.join('\n,')}"
      )
      respond_to do |format|

        format.html do
          @categories = Category.includes(:events).where('events.is_theme = ?', true).references(:events)
          flash[:alert] = error_msg
          render :edit
        end

        format.json do
          render json: { message: error_msg }, status: :bad_request
        end
      end
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
    sanitaized_params.require(:event).permit(:id, :theme_id, :category_id, :text_1, :text_2, :text_3, :name, :url, pictures_attributes: [:id, :image, :order, :slideshow, :_destroy], appearance_attributes: [:id, :font_family_1, :font_color_1, :font_size_1, :font_family_2, :font_color_2, :font_size_2, :font_family_3, :font_color_3, :font_size_3, :background_image], information_attributes: [:id, :in_use, :summary, :location, :organizer, :organizer_email, :time_zone, :start_time, :end_time])
  end

  def sanitaized_params
    params
    # params[:event][:pictures_attributes].keep_if do |key, value|
    #   value[:image].present? || value[:_destroy] == 'true' # => don't save just the order & slideshow
    # end
    # in_use = params[:event][:information_attributes][:in_use]
    # params[:event][:information_attributes][:in_use] = in_use == 'true'
    # params
  end

  def theme_for_copy
    category = if params[:category_id].present?
      Category.find_by_id params[:category_id]
    else
      Category.first
    end

    if params[:theme_id]
      category.events.themes.includes(:pictures, :information, :appearance).where(
        id: params[:theme_id]
      )
      .first
    else
      category.events.themes.includes(:pictures, :information, :appearance).first
    end
  end
end
