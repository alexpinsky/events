class EventsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :show

  before_filter :set_event, only: [
    :destroy,
    :publish,
    :unpublish
  ]

  def index
    @events = current_user.events.includes(
      :category,
      :theme,
      :information,
      :pictures,
      :views
    )
    .order('events.created_at DESC')
  end

  def show
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

    if @event && @event.viewable_for?(current_user)
      Analytics::ViewsCounter.new_view event: @event, ip: request.ip, referer: request.referer
      render layout: "display"
    else
      redirect_to root_path
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path, notice: 'Your event has been deleted'
    else
      redirect_to events_path, alert: 'Sorry... but something went wrong'
    end
  end

  def publish
    if @event.update_attributes _publish_params
      respond_to do |format|
        message = 'Your event is public now!'

        format.json do
          render json: {
            event: {
              id:       @event.id,
              url:      @event.url,
              full_url: @event.full_url
            },
            message: message
          },
          status: :ok
        end
        format.html { redirect_to events_path, notice: message }
      end
    else
      respond_to do |format|
        format.json { render json: @event.errors.full_messages.join(', '), status: :bad_request }
        format.html { redirect_to events_path }
      end
    end
  end

  def unpublish
    if @event.update_attributes(state: Event::STATES[:unpublished], url: nil)
      respond_to do |format|
        message =  'Your event is private now!'

        format.json do
          render json: {
           event: {
              id:       @event.id,
              url:      @event.url,
              full_url: @event.full_url
            },
            message: message
          },
          status: :ok
        end
        format.html { redirect_to events_path, notice: message }
      end
    else
      respond_to do |format|
        format.json { render json: {}, status: :bad_request }
        format.html { redirect_to events_path }
      end
    end
  end

  private

  def _publish_params
    publish_params = { state: Event::STATES[:pending] }
    publish_params.merge!(
      url: params[:url].gsub(' ', '-')
    ) unless _default_route? event_id: @event.id, url: params[:url]

    publish_params
  end

  def _default_route?(args)
    "events/#{args[:event_id]}" == args[:url]
  end

  def set_event
    @event = current_user.events.find params[:id]
  end
end
