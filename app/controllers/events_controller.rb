class EventsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :show

  before_filter :_set_event, only: [
    :update,
    :destroy,
    :publish,
    :unpublish
  ]
  before_filter :_set_theme,      only: :new
  before_filter :_set_categories, only: [:new, :edit]

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

  def new
    event = Event.copy_from_theme @theme, user: current_user
    render :new, locals: {
      event: event,
      event_json: event.to_json(new_event: true),
      theme: @theme,
      categories: @categories
    }
  end

  def create
    @event = current_user.events.new _event_params

    if @event.save
      render json: {
        event:   { id: @event.id, name: @event.name },
        message: 'Your event was saved!'
      }, status: :ok
    else
      render json: {
        message: @event.errors.full_messages.join(', ')
      }, status: :bad_request
    end
  end

  def edit
    event = current_user.events.includes(
      :pictures,
      :appearance,
      :information
    )
    .find params[:id]

    if params[:theme_id]
      # trying to change existing event's theme
      _set_theme
      event.update_from_theme @theme
    end

    event.build_missing

    render :edit, locals: {
      event: event,
      event_json: event.to_json,
      theme: @theme,
      categories: @categories
    }
  end

  def update
    if @event.update_attributes _event_params
      render json: {
        event:   { id: @event.id, name: @event.name },
        message: 'Your event was saved!'
      }, status: :ok
    else
      render json: {
        message: @event.errors.full_messages.join(', ')
      }, status: :bad_request
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

  def _event_params
    _sanitaized_params.require(:event).permit(
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
        :image_url,
        :order,
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

  def _sanitaized_params
    _sanitaize_pictures_params if params[:event][:pictures_attributes]
    params.merge(is_theme: false)
  end

  def _sanitaize_pictures_params
    params[:event][:pictures_attributes].keep_if do |_, value|
      value[:image_url].present? || value[:_destroy] == 'true' # => don't save just the order & slideshow
    end
  end

  def _set_event
    @event = current_user.events.find params[:id]
  end

  def _set_theme
    dynamic_clause = params[:theme_id].present? ? 'events.id = ?' : ''
    @theme = Event.themes.active.includes(
      :pictures,
      :information,
      :appearance
    )
    .where(dynamic_clause, params[:theme_id]).first
  end

  def _set_categories
    @categories = Category.includes(:events).where('events.is_theme = ?', true).references(:events)
  end
end
