module ApplicationHelper

  def show_unpublish_button?(event)
    event.published? || event.pending?
  end

  def event_url(event)
    event.url.present? ? event.url : "events/#{event.id}"
  end

  def time_format(time = nil)
    return '' unless time
    time.strftime('%F %H:%M')
  end

  def asset_url(page_name, image_name)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/#{page_name}/#{image_name}"
  end

  def shared_assets_url(asset_name)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/shared/#{asset_name}"
  end

  def background_names
    ['dark_wall', 'tileable_wood', 'white_feathers', 'food', 'mocha_grunge', 'skulls', 'tree_bark']
  end

  def background_collection_url(background_image)
    background_image ||= "dark_wall"
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/backgrounds/#{background_image}.png"
  end

  def welcome_page?
    @page == 'welcome'
  end

  def spinner_path
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/images/spinner.gif"
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def friendly_color
    random = Random.new
    # randomize rgb and mix with white color
    red   = (random.rand(256) + 255) / 2
    green = (random.rand(256) + 255) / 2
    blue  = (random.rand(256) + 255) / 2

    "rgb(#{red}, #{green}, #{blue})"
  end
end
