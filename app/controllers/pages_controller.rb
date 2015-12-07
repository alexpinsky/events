class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def welcome
    respond_to do |format|
      format.html   {  }
      format.mobile { render layout: false }
    end
  end

  def admin
  end

  def about
  end

  def privacy_policy
    render layout: false
  end

  def terms_of_service
    render layout: false
  end

  def ping
    render nothing: true, status: :ok
  end

  def react
    event = Event.last
    render :react, locals: { event: { id: event.id, name: event.name }.to_json }
  end

  def image
    preloaded = Cloudinary::PreloadedFile.new(params[:image_id])
    puts ">>>>>> preloaded.valid?: #{preloaded.valid?}"
    puts ">>>>>> preloaded.identifier: #{preloaded.identifier}"
  end

  private

  def _set_page
    @page = 'welcome'
  end
end
