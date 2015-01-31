class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def welcome
    
  end

  def ping
    render json: {}, status: :ok
  end
  
  def comming_soon
    @lead = Lead.new
    render layout: false
  end
end
