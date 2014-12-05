module EventsHelper

  def px_to_rem(px)
    px.to_f / 16
  end

  def event_visibility(event)
    event.information.try(:in_use) ? 'visible' : 'hidden'
  end
end
