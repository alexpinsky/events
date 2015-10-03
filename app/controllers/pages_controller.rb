class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def welcome
    respond_to do |format|
      format.html   {  }
      format.mobile { render layout: false }
    end
  end

  def about
  end

  def ping
    render nothing: true, status: :ok
  end

  def comming_soon
    @lead = Lead.new
    render layout: false
  end

  private

  def _set_page
    @page = 'welcome'
  end
end
