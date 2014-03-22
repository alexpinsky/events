class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def welcome
    if current_user
      redirect_to after_sign_in_path(current_user) 
    else
      redirect_to new_user_session_path
    end
  end
end
