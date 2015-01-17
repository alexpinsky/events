class LeadsController < ApplicationController
  skip_before_filter :authenticate_user!, only: :create

  def index
    @leads = Lead.all
  end
  
  def show
    
  end

  def new
    
  end

  def create
    lead = Lead.new lead_params
    if lead.save
      render json: {}, status: :created
    else
      render json: {error: lead.errors.full_messages}, status: :bad_request
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

private

  def lead_params
    params.require(:lead).permit(:email)
  end
end