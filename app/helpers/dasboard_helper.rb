module DasboardHelper
  def event_url(event)
    event.url.present? ? event.url : "events/#{event.id}"
  end
end