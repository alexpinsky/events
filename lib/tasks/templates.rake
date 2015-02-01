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
            "text_3" => "10/07", 
            "category_id" => categroy.id, 
            "is_theme" => true, 
            'appearance_attributes' => {
              "background_image" => "dark_wall", 
              "font_family_1" => "'Six Caps', sans-serif",
              "font_color_1" => "#fff", 
              "font_size_1" => "7", 
              "font_family_2" => "'Lobster', cursive", 
              "font_color_2" => "#fff", 
              "font_size_2" => "3", 
              "font_family_3" => "'Six Caps', sans-serif", 
              "font_color_3" => "#fff", 
              "font_size_3" => "10", 
            }
          })
          Information.create!(in_use: true, event: theme)
          pic = theme.pictures.new(slideshow: false, order: 1)
          pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/classic/images/image_1.jpg'
          pic.save!
        end
      end
    end

    namespace :paris do
      
      task create: :environment do
        ActiveRecord::Base.transaction do
          categroy = Category.by_name('wedding').first || Category.create!(name: 'wedding')
          theme = Event.create!({
            "name" => "paris", 
            "text_1" => "21/12/1", 
            "text_2" => "save the date", 
            "text_3" => "Natasha & Jonathan", 
            "category_id" => categroy.id, 
            "is_theme" => true, 
            'appearance_attributes' => {
              "background_image" => "", 
              "font_family_1" => "'Six Caps', sans-serif",
              "font_color_1" => "#000", 
              "font_size_1" => "6", 
              "font_family_2" => "'Six Caps', sans-serif", 
              "font_color_2" => "#000", 
              "font_size_2" => "6", 
              "font_family_3" => "'Fanwood Text', serif", 
              "font_color_3" => "#000", 
              "font_size_3" => "1.5", 
            }
          })
          Information.create!(in_use: true, event: theme)
          pic = theme.pictures.new(slideshow: false, order: 1)
          pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/paris/images/paris.jpg'
          pic.save!
        end
      end
    end
  end
end