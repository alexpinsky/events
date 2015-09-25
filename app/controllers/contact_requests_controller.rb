class ContactRequestsController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:new, :create]

  def index
  end

  def show
  end

  def new
    @contact_request = ContactRequest.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
