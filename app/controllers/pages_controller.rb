class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def welcome
    
  end

  def ping
    render nothing: true, status: :ok
  end
  
  def comming_soon
    @lead = Lead.new
    render layout: false
  end

private

  def set_page
    @page = 'welcome'
  end
end
