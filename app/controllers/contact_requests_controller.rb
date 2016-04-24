class ContactRequestsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]

  def new
    @contact_request = ContactRequest.new
  end

  SUCCESS_MESSAGE = 'Your request sent successfully'
  def create
    @contact_request = ContactRequest.new contact_request_params

    if @contact_request.save
      redirect_to new_contact_request_path, notice: SUCCESS_MESSAGE
    else
      flash[:alert] = @contact_request.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:email, :message)
  end
end
