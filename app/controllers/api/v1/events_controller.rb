module Api
  module V1
    class EventsController < ApplicationController
      skip_before_filter :authenticate_user!, only: :show

      def index
        events = current_user.events.includes(template: [:category]).order('created_at desc')
        render json: Hash[events.map { |e| [e.id, EventPresenter.new(e)] }]
      end

      def show
        # event = Events.find params[:id]
        # render json: EventPresenter.new(event)
      end

      def edit
        event = current_user.events.includes(template: [:category]).find params[:id]
        render json: EventPresenter.new(event)
      end

      def create
        respond_with_save do
          current_user.events.new
        end
      end

      def update
        respond_with_save do
          current_user.events.find params[:id]
        end
      end

      def destroy
        event = current_user.events.find params[:id]

        # if event.destroy
        if false
          render nothing: true, status: :ok
        else
          render json: EventPresenter.new(event), status: :bad_request
        end
      end

      def publish
        respond_with_save do
          event = current_user.events.find params[:id]
          event.state = Event::STATES[:pending]
          event
        end
      end

      def unpublish
        respond_with_save do
          event = current_user.events.find params[:id]
          event.state = Event::STATES[:saved]
          event
        end
      end

      private

      def respond_with_save
        event = yield
        event.name        = params[:name]
        event.url         = params[:url]
        event.template    = Template.where(name: params[:template][:name]).first
        event.texts       = params[:texts]
        event.pictures    = params[:pictures]
        event.appearance  = params[:appearance]
        event.information = params[:information]

        if event.save
          status  = :ok
        else
          status  = :bad_request
        end

        render json: EventPresenter.new(event), status: status
      end
    end
  end
end
