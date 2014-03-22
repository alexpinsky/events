class EventsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:show]
  before_filter :set_user, except: [:show]
  before_filter :set_display # for now..

  def index
    @events = @user.events
    @event = @user.events.new
  end

  def create
    @event = @user.events.create
    redirect_to edit_user_event_path(@user, @event)
  end

  def show
    id = params[:id].to_i
    if id == 0
      @event = Event.find_by_url params[:id]
    else
      @event = Event.find id
    end
    render layout: "display"
  end

  def edit
    @event = @user.events.includes(:pictures, :appearance, :information, :song).find params[:id]
  end

  def update
    @event = @user.events.find params[:id]
    respond_to do |format|
      format.html do
        if @event.update_attributes(event_params.except(:pictures_attributes, :song_attributes))
          redirect_to user_events_path(@user)
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
          result = @event.add_picture(event_params[:pictures_attributes], params[:first_image])
        else
          result = @event.add_song(event_params[:song_attributes])
        end
        render json: { error: result[:error], success: result[:success] }, :status => :ok
      end
    end
  end

  def destroy
    @event = @user.events.find params[:id]
    if @event.destroy
      flash[:success] = "Event was successfully deleted"
    else
      flash[:alert] = @event.errors.full_messages
    end
    redirect_to user_events_path(@user)
  end

  def reload_preview
    @event = @user.events.includes(:pictures, :appearance, :information, :song).find params[:id]
  end

private

  def set_display
    @theme = "default"
  end

  def event_params
    params.require(:event).permit(:name, :primary_text, :secondary_text, :extra_text, pictures_attributes: [:id, :image], appearance_attributes: [:id, :background_image, :font_family, :font_color], information_attributes: [:id, :summary, :location, :organizer, :organizer_email, :zone_code, :start_time, :end_time], song_attributes: [:id, :audio])
  end
end
