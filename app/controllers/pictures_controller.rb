class PicturesController < ApplicationController

  def destroy

    if remote_source?
      Files::Service.remove_by_url params[:url]
    else
      # regular delete..
    end

    render nothing: true, status: :ok
  end

  private

  REMOTE_KEY = 'remote_source'
  def remote_source?
    params[:id] == REMOTE_KEY
  end
end
