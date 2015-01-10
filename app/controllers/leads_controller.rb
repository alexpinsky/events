class LeadsController < ApplicationController

  def index
    
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
      render json: {}, status: :bad_request
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