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

  # callback params: {"tx"=>"2M279133CP4466324", "st"=>"Completed", "amt"=>"35.00", "cc"=>"ILS", "cm"=>"", "item_number"=>"1"}
  def pay
    # l9wRBvhFA3G6wRO2CgumRouUvAMpJKukS6VaZwtMHYbLQFpC_0LbNKxnhiu
    render layout: false
  end
end
