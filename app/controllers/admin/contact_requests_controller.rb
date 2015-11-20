class Admin::ContactRequestsController < ApplicationController

  def index
    @requests = ContactRequest.order('created_at desc')
  end

  def show
    @request = ContactRequest.find params[:id]
  end
end
