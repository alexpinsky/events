module EventsHelper

  def px_to_rem(px)
    px.to_f / 16
  end

  def event_visibility(event)
    event.information.try(:in_use) ? 'visible' : 'hidden'
  end

  def image_url(event, order)
    image_url = event.pictures.by_order(order).try(:image_url)
    image_url ||= event.theme.pictures.by_order(order).image_url
  end

  def slideshow_pics_for(event)
    event.theme.pictures.slideshow.ordered
  end
end
