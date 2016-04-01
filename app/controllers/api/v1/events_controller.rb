module Api
  module V1
    class EventsController < ApplicationController

      def create
        event = current_user.events.new event_params
        event.template = Template.where(name: params[:template][:name]).first

        # if event.save
        if true
          status = :ok
        else
          status = :bad_request
        end

        render json: EventPresenter.new(event), status: status
      end

      def update
        # if @event.update_attributes _event_params
        #   render json: {
        #     event:   { id: @event.id, name: @event.name },
        #     message: 'Your event was saved!'
        #   }, status: :ok
        # else
        #   render json: {
        #     message: @event.errors.full_messages.join(', ')
        #   }, status: :bad_request
        # end
      end

      private

      def event_params
        params.permit(:name, :url, :texts, :pictures, :appearance, :information)
      end
    end
  end
end
