module ApplicationHelper

  def background_names
    ['dark_wall', 'tileable_wood', 'white_feathers']
  end

  def fonts_for_select
    [['Arial', 'Arial'], ['Hand Write', 'hand_write'], ['Jack Stroy', 'jack_story'], ['Adine Kirnberg', 'adine_kirnberg']]
  end

  def background_collection_url(background_image)
    background_image ||= "dark_wall"
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/#{background_image}.png"
  end

  def example_image_url
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/images/placeholder.png"
  end

  def example_song_url
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/audio/wedding_song.mp3"
  end

  def spinner_path
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/images/spinner.gif"
  end

  def text_defaults(name)
    @texts ||= {
      name: "My Event",
      primary: "Save the Date",
      secondary: "July, 10 | My Event",
      extra: "Come to celebrate",
      headline: "My Event",
      location: "Oxford Street, London, United Kingdom",
      organizer: "my name",
      organizer_email: "my email"
    }
    @texts[name]
  end
end
