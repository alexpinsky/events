module EventsHelper

  def slideshow_images_for(event)
    event.pictures.sort { |pic_1, pic_2| pic_1.order <=> pic_2.order }.map { |pic| pic if pic.image_url }.compact
  end

  def dashboard_tile_backgroud_for(event)
    pic = event.pictures.first
    pic.nil? ? '' : pic.image_url
  end

  def event_visibility(event)
    event.information.try(:in_use) ? 'visible' : 'hidden'
  end

  def image_url(event, order)
    picture = event.pictures.select do |pic|
      pic.order == order && pic.image_url
    end
    picture = event.theme.pictures.select do |pic|
      pic.order == order && pic.image_url
    end if picture.blank?
    picture.first.image_url
  end

  def aws_asset_url(event, asset_name)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/#{event.category_name}/themes/#{event.theme_name}/assets/#{asset_name}"
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
