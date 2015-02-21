module EventsHelper

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

  def slideshow_pics_for(event)
    event.theme.pictures.select {|pic| pic.slideshow}.sort {|pic| pic.order}
  end

  def aws_asset_url(event, asset_name)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/#{event.category_name}/themes/#{event.theme_name}/assets/#{asset_name}"
  end

  def fonts_for_select
    [['Arial', 'Arial'], ['Hand Write', 'hand_write'], ['Jack Stroy', 'jack_story'], ['Adine Kirnberg', 'adine_kirnberg'], ['Little Flower', 'little_flower'], ['Munich', 'munich']]
  end
end
