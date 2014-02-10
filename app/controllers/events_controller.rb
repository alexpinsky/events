class EventsController < ApplicationController
  def index
  end

  def new
    @template = "default"
    @background_image = "https://s3-us-west-2.amazonaws.com/events-assets-static/backgrounds/dark_wall.png"
    @user = User.last
    @event = @user.events.new # change to -> @event = current_user.events.new
    4.times { @event.pictures.build }
  end

  def create
    @user = User.last
    @event = @user.events.new event_params # change to -> @event = current_user.events.new
    if @event.save
      redirect_to user_events_path(@user)
    else
      puts "***** ERROR: #{@event.errors.full_messages} *****"
      @template = "default"
      render :new
    end
  end

  def show
    @user = User.last
    @event = @user.events.last
    @template = "default"
    @background_image = "https://s3-us-west-2.amazonaws.com/events-assets-static/backgrounds/dark_wall.png"
    render layout: "display"
  end

  def edit
  end

  def update
  end

  def destroy
  end

private

  def set_user
  end

  def event_params
    params.require(:event).permit(:name, :title, :description, pictures_attributes: [:image])
  end
end
