module Api
  module V1
    class FilesController < ApplicationController

      def destroy
        Files::Service.remove_by_url params[:url]
        render nothing: true, status: :ok
      end
    end
  end
end
