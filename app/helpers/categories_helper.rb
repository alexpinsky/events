module CategoriesHelper

  THUMBNAIL_PLACEHOLDER = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/categories/thumbnail+coming+soon+a.svg'
  NAME_PLACEHOLDER      = 'unknown'
  
  def thumbnail_url_for(template)
    if template.id
      template.thumbnail_url
    else
      THUMBNAIL_PLACEHOLDER
    end
  end

  def name_for(template)
    if template.id
      template.name
    else
      NAME_PLACEHOLDER
    end
  end
end