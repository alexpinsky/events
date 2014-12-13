namespace :db do

  task create_fake_themes: :environment do
    ActiveRecord::Base.transaction do
      categroy = Category.create!(name: 'other')
      theme = Event.create!({
        "name"=>"default", 
        "text_1"=>"Save the Date", 
        "text_2"=>"July, 10 | My event", 
        "category_id"=>categroy.id, 
        "is_theme"=>true, 
        "preview_url"=>"https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/other/themes/default/preview_thumbnail.jpg",
        'appearance_attributes' => {
          "background_image"=>"dark_wall", 
          "font_family_1"=>"jack_story",
          "font_color_1"=>"#fff", 
          "font_size_1"=>24, 
          "font_family_2"=>"jack_story", 
          "font_color_2"=>"#fff", 
          "font_size_2"=>16, 
        }
      })
      pic = theme.pictures.new(slideshow: true, order: 1)
      pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/other/themes/default/images/image_1.jpg'
      pic.save!
      pic = theme.pictures.new(slideshow: true, order: 2)
      pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/other/themes/default/images/image_2.jpg'
      pic.save!

      categroy = Category.create!(name: 'birthday')
      theme = Event.create!({
        "name"=>"default", 
        "text_1"=>"Save the Date", 
        "text_2"=>"July, 10 | My event",
        "category_id"=>categroy.id, 
        "is_theme"=>true, 
        "preview_url"=>"https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/birthday/themes/default/preview_thumbnail.jpg",
        'appearance_attributes' => {
          "background_image"=>"dark_wall", 
          "font_family_1"=>"jack_story", 
          "font_color_1"=>"#fff",
          "font_size_1"=>24, 
          "font_family_2"=>"jack_story", 
          "font_color_2"=>"#fff", 
          "font_size_2"=>16
        } 
      })
      pic = theme.pictures.new(slideshow: true, order: 1)
      pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/birthday/themes/default/images/image_1.jpg'
      pic.save!
      pic = theme.pictures.new(slideshow: true, order: 2)
      pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/birthday/themes/default/images/image_2.jpg'
      pic.save!

      categroy = Category.create!(name: 'party')
      theme = Event.create!({
        "name"=>"default_3", 
        "text_1"=>"Save the Date", 
        "text_2"=>"July, 10 | My event",
        "category_id"=>categroy.id,
        "is_theme"=>true, 
        "preview_url"=>"https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/party/themes/default_3/preview_thumbnail.jpg",
        'appearance_attributes' => {
          "background_image"=>"dark_wall", 
          "font_family_1"=>"jack_story", 
          "font_color_1"=>"#fff", 
          "font_size_1"=>24, 
          "font_family_2"=>"jack_story", 
          "font_color_2"=>"#fff", 
          "font_size_2"=>16
        }
      })
      pic = theme.pictures.new(slideshow: false, order: 1)
      pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/party/themes/default_3/images/image_1.jpg'
      pic.save!
      pic = theme.pictures.new(slideshow: true, order: 2)
      pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/party/themes/default_3/images/image_2.jpg'
      pic.save!
      pic = theme.pictures.new(slideshow: true, order: 3)
      pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/party/themes/default_3/images/image_3.jpg'
      pic.save!

      categroy = Category.create!(name: 'wedding')
      theme = Event.create!({
        "name"=>"default_2", 
        "text_1"=>"Save the Date", 
        "text_2"=>"July, 10 | My event",
        "category_id"=>categroy.id,
        "is_theme"=>true, 
        "preview_url"=>"https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/default_2/preview_thumbnail.jpg",
        'appearance_attributes' => {
          "background_image"=>"dark_wall", 
          "font_family_1"=>"jack_story", 
          "font_color_1"=>"#fff",
          "font_size_1"=>24, 
          "font_family_2"=>"jack_story", 
          "font_color_2"=>"#fff", 
          "font_size_2"=>16
        }
      })
      pic = theme.pictures.new(slideshow: false, order: 1)
      pic.remote_image_url = 'https://s3-eu-west-1.amazonaws.com/events-assets-static/categories/wedding/themes/default_2/images/image_1.png'
      pic.save!
    end
  end
end