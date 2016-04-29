class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def welcome
    respond_to do |format|
      format.html
      format.mobile { render layout: false }
    end
  end

  def app
    render layout: false
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
end
