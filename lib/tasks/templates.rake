namespace :templates do
  
  namespace :wedding do
    
    namespace :classic do
      
      task create: :environment do
        ActiveRecord::Base.transaction do
          categroy = Category.by_name('wedding').first || Category.create!(name: 'wedding')
          theme = Event.create!({
            "name" => "classic", 
            "text_1" => "save the date", 
            "text_2" => "July, 10 | My event", 
            "text_3" => "10/7", 
            "category_id" => categroy.id, 
            "is_theme" => true, 
            "preview_url" => "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/classic/preview_thumbnail.png",
            'appearance_attributes' => {
              "background_image" => "", 
              "font_family_1" => "'Six Caps', sans-serif",
              "font_color_1" => "#fff", 
              "font_size_1" => '4.5', 
              "font_family_2" => "'Lobster', cursive", 
              "font_color_2" => "#fff", 
              "font_size_2" => '2',
              "font_family_3" => "'Six Caps', sans-serif", 
              "font_color_3" => "#fff", 
              "font_size_3" => '9'
            }
          })
          Information.create!(in_use: true, event: theme)
          pic = theme.pictures.new(slideshow: false, order: 1)
          pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/classic/images/image_1.jpg'
          pic.save!
        end
      end
    end
  end
end