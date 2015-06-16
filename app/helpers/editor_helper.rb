module EditorHelper
  def slideshow_images_for(event)
    event.pictures.sort { |pic_1, pic_2| pic_1.order <=> pic_2.order }.map { |pic| pic if pic.image_url }.compact
  end

  def fonts_for_select
    [
      ['Lobster', "'Lobster', cursive"],
      ['Quattrocento', "'Quattrocento Sans', sans-serif"],
      ['Lobster', "'Lobster', cursive"],
      ['Vibur', "'Vibur', cursive"],
      ['Fanwood Text', "'Fanwood Text', serif"],
      ['Six Caps', "'Six Caps', sans-serif"]
    ]
  end

  def background_urls
    [
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/blue_stripes.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/dark_stripes.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/diagonal_striped_brick.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/swirl_pattern.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/wavegrid.png",
      "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/whitediamond.png"
    ]
  end
end