class EventsController < ApplicationController
  before_filter :set_user
  before_filter :set_display # for now..

  def index
  end

  def new
    @event = @user.events.new
    @event.appearance.new(font_family: 'hand_write')
    4.times { @event.pictures.build }
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
    @user = User.last
    @event = @user.events.last
    render layout: "display"
  end

  def edit
    @event = @user.events.includes(:pictures, :appearance).find params[:id]
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
    @user = User.last
  end

  def set_display
    @template = "default"
    @background_image = "https://s3-us-west-2.amazonaws.com/events-assets-static/backgrounds/dark_wall.png"
  end

  def event_params
    params.require(:event).permit(:name, :title, :description, pictures_attributes: [:id, :image], appearance_attributes: [:background_image, :font_family, :font_color])
  end
end
