module ApplicationHelper

  def background_collection_url(background_image)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/#{background_image}.png"
  end

  def example_image_url(number)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/images/image#{number}.jpeg"
  end

  def example_song_url
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/audio/wedding_song.mp3"
  end
end
