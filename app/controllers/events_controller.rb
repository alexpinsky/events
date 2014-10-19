class EventsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:show]
  before_filter :set_display # for now..

  def index
    @events = current_user.events
    @event = Event.new
  end

  def create
    # params[:category_id], params[:theme_id]
    @event = Event.create_from_theme(category, theme, current_user)
    redirect_to edit_event_path(@event)
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

  def edit
    @event = current_user.events.includes(:pictures, :appearance, :information, :song).find params[:id]
  end

  def update
    @event = current_user.events.find params[:id]
    respond_to do |format|
      format.html do
        if @event.update_attributes(event_params.except(:pictures_attributes, :song_attributes))
          redirect_to events_path
          flash[:success] = "Event was successfully updated"
        else
          flash[:alert] = "bla bla bla"
          render :edit
        end
      end
      format.js do
        # assets creation
        result = {}
        if params[:file_type] == "image"
          result = @event.add_pictures(event_params[:pictures_attributes], params[:first_image] == 'true')
        else
          result = @event.add_song(event_params[:song_attributes])
        end
        render json: { error: result[:error], success: result[:success] }, :status => :ok
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

  def set_display
    @theme = "default"
  end

  def event_params
    params.require(:event).permit(:name, :primary_text, :secondary_text, :extra_text, pictures_attributes: [:id, :image], appearance_attributes: [:id, :background_image, :font_family, :font_color], information_attributes: [:id, :summary, :location, :organizer, :organizer_email, :time_zone, :start_time, :end_time], song_attributes: [:id, :audio])
  end
end
