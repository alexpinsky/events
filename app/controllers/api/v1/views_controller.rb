module Api
  module V1
    class ViewsController < ApplicationController

      def create
        event = Event.find params[:event_id]
        event.views.create ip: request.ip, referer: request.referer

        render nothing: true, status: :ok
      end
    end
  end
end
