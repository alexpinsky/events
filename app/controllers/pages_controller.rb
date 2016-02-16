class PagesController < ApplicationController
  skip_before_filter :authenticate_user!

  def welcome
    respond_to do |format|
      format.html
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

  def play
    render layout: false
  end

  def get
    render json: {
      name: 'my event',
      texts: {
        1 => { text: 'first text' },
        2 => { text: 'second text' },
        3 => { text: 'third text' }
      }
    }
  end

  private

  def _set_page
    @page = 'welcome'
  end
end
