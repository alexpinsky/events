module ApplicationHelper

  def asset_url(page_name, image_name)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/#{page_name}/#{image_name}"
  end

  def shared_assets_url(asset_name)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/shared/#{asset_name}"
  end

  def welcome_page?
    @page == 'welcome'
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
