module Api
  module V1
    class EventsController < ApplicationController
      skip_before_filter :authenticate_user!, only: :show

      def show
        # event = Events.find params[:id]
        # render json: EventPresenter.new(event)
      end

      def edit
        event = current_user.events.includes(template: [:category]).find params[:id]
        render json: EventPresenter.new(event)
      end

      def create
        event = current_user.events.new event_params

        event.template    = Template.where(name: params[:template][:name]).first
        event.texts       = params[:texts]
        event.pictures    = params[:pictures]
        event.appearance  = params[:appearance]
        event.information = params[:information]

        if event.save
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
        params.permit(:name, :url)
      end
    end
  end
end
