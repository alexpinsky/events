module TemplatesHelper
  
  def category_image_url(category_name)
    "https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/templates/icons/#{category_name}.png"
  end

  def category_color(category_name)
    case category_name
    when 'wedding'
      '#0994e4'
    when 'birthday'
      '#e4096b'
    when 'party'
      '#ffae00'
    when 'other'
      '#06d458'
    end
  end
end