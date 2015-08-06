require 'action_view/helpers/javascript_helper'

class EventsController < ApplicationController
  include ActionView::Helpers::JavaScriptHelper

  skip_before_filter :authenticate_user!, only: :show

  before_filter :set_event, only: [
    :update,
    :destroy,
    :publish,
    :unpublish
  ]
  before_filter :set_theme, only: :new
  before_filter :set_categories, only: [:new, :edit]

  MESSAGES = {
    update: {
      success: "Event was successfully updated"
    }
  }

  def index
    @events = current_user.events.includes(:category, :theme, :pictures).order('events.updated_at DESC')
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
    @event = Event.copy_from_theme @theme, user: current_user
  end

  def create
    @event = current_user.events.new event_params

    if @event.save
      render json: { event_id: @event.id }, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def edit
    @event = current_user.events.includes(
      :pictures,
      :appearance,
      :information
    )
    .find params[:id]

    if params[:theme_id]
      # trying to change existing event's theme
      set_theme
      @event.update_from_theme @theme
    end

    @event.build_missing
  end

  def update
    if @event.update_attributes event_params
      render json: { event_id: @event.id }, status: :ok
    else
      render json: {}, status: :bad_request
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    else
      redirect_to events_path
    end
  end

  def publish
    if @event.update_attributes url: params[:url], published: true
      render json: { url: @event.full_url }, status: :ok
    else
      render json: @event.errors.full_messages.join(', '), status: :bad_request
    end
  end

  def unpublish

  end

  private

  def event_params
    sanitaized_params.require(:event).permit(
      :id,
      :theme_id,
      :category_id,
      :text_1,
      :text_2,
      :text_3,
      :name,
      :url,
      pictures_attributes: [
        :id,
        :image,
        :order,
        :slideshow,
        :_destroy
      ],
      appearance_attributes: [
        :id,
        :font_family_1,
        :font_color_1,
        :font_size_1,
        :font_family_2,
        :font_color_2,
        :font_size_2,
        :font_family_3,
        :font_color_3,
        :font_size_3,
        :background_image
      ],
      information_attributes: [
        :id,
        :in_use,
        :summary,
        :location,
        :organizer,
        :organizer_email,
        :time_zone,
        :start_time,
        :end_time
      ])
  end

  def sanitaized_params
    sanitaize_pictures_params if params[:event][:pictures_attributes]
    # in_use = params[:event][:information_attributes][:in_use]
    # params[:event][:information_attributes][:in_use] = in_use == 'true'
    params.merge(is_theme: false)
  end

  def sanitaize_pictures_params
    params[:event][:pictures_attributes].keep_if do |key, value|
      value[:image].present? || value[:_destroy] == 'true' # => don't save just the order & slideshow
    end
  end

  def set_event
    @event = current_user.events.find params[:id]
  end

  def set_theme
    dynamic_clause = params[:theme_id].present? ? 'events.id = ?' : ''
    @theme = Event.themes.includes(
      :pictures,
      :information,
      :appearance
    )
    .where(dynamic_clause, params[:theme_id]).first
  end

  def set_categories
    @categories = Category.includes(:events).where('events.is_theme = ?', true).references(:events)
  end
end
