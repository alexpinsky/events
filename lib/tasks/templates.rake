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

    namespace :funfun do
      
      task create: :environment do
        ActiveRecord::Base.transaction do
          categroy = Category.by_name('wedding').first || Category.create!(name: 'wedding')
          theme = Event.create!({
            "name" => "funfun", 
            "text_1" => "July, 10", 
            "text_2" => "my event", 
            "category_id" => categroy.id, 
            "is_theme" => true, 
            "preview_url" => "https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/funfun/preview_thumbnail.png",
            'appearance_attributes' => {
              "background_image" => "grey", 
              "font_family_1" => "'Playfair Display', serif",
              "font_color_1" => "#000", 
              "font_size_1" => '11', 
              "font_family_2" => "'Lobster', cursive", 
              "font_color_2" => "rgb(0, 113, 186)", 
              "font_size_2" => '6',
            }
          })
          Information.create!(in_use: true, event: theme)
          pic = theme.pictures.new(slideshow: false, order: 1)
          pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/funfun/images/image_1.png'
          pic.save!
        end
      end
    end
  end
end