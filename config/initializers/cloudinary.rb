Cloudinary.config do |config|
  config.api_key              = ENV['CLOUDINARY_API_KEY']
  config.api_secret           = ENV['CLOUDINARY_API_SECRET']
  config.cloud_name           = 'eventit-me'
  config.enhance_image_tag    = true
  config.static_image_support = false
end