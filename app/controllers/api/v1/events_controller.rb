module Api
  module V1
    class EventsController < ApplicationController

      def create
        render nothing: true, status: :bad_request
        # @event = current_user.events.new _event_params

        # if @event.save
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
        sanitaized_params.require(:event).permit(
          :id,
          :theme_id,
          :category_id,
          :text_1,
          :text_2,
          :text_3,
          :name,
          :url,
          pictures_attributes: [
            :id,
            :image_url,
            :order,
            :_destroy
          ],
          appearance_attributes: [
            :id,
            :font_family_1,
            :font_color_1,
            :font_size_1,
            :font_family_2,
            :font_color_2,
            :font_size_2,
            :font_family_3,
            :font_color_3,
            :font_size_3,
            :background_image
          ],
          information_attributes: [
            :id,
            :in_use,
            :summary,
            :location,
            :organizer,
            :organizer_email,
            :time_zone,
            :start_time,
            :end_time
          ])
      end

      def sanitaized_params
        sanitaize_pictures_params if params[:event][:pictures_attributes]
        params.merge(is_theme: false)
      end

      def sanitaize_pictures_params
        params[:event][:pictures_attributes].keep_if do |_, value|
          value[:image_url].present? || value[:_destroy] == 'true' # => don't save just the order & slideshow
        end
      end
    end
  end
end
