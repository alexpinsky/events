class EventsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:show]
  before_filter :set_user, except: [:show]
  before_filter :set_display # for now..

  def index
  end

  def new
    @event = @user.events.new_example
  end

  def create
    @event = @user.events.new event_params
    if @event.save
      redirect_to edit_user_event_path(@user, @event)
    else
      puts "***** Error: #{@event.errors.full_messages} *****"
      render :new
    end
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
    (4 - @event.pictures.size).times { @event.pictures.build }
    @event.build_song if @event.song.nil?
  end

  def update
    @event = @user.events.find params[:id]
    if @event.update_attributes(event_params)
      redirect_to edit_user_event_path(@user, @event)
    else
      puts "***** Error: #{@event.errors.full_messages} *****"
      render :edit
    end
  end

  def destroy
  end

private

  def set_user
    @user = current_user
  end

  def set_display
    @theme = "default"
  end

  def event_params
    params.require(:event).permit(:name, :primary_text, :secondary_text, :extra_text, pictures_attributes: [:id, :image], appearance_attributes: [:id, :background_image, :font_family, :font_color], information_attributes: [:id, :summary, :location, :organizer, :organizer_email, :zone_code, :start_time, :end_time], song_attributes: [:id, :audio])
  end
end
