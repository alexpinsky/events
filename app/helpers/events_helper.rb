module EventsHelper
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
end
