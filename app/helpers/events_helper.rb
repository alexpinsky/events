module EventsHelper

  def inline_style(event)
    background = event.appearance.background;

    bg_val = if (background.type == Event::BACKGROUND_TYPES.image)
      "url(#{background.url})"
    else
      background.color;
    end

    return "background: #{bg_val};"
  end
end
