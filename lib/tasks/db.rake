namespace :db do

  task create_categories: :environment do
    categories_names = ['wedding', 'birthday', 'party', 'other']
    categories_names.each do |category_name|
      category = Category.create(name: category_name) if Category.by_name(category_name).blank?
    end
  end

  task create_fake_themes: :environment do
    Category.all.each do |category|
      category.events.create(
        name: 'default',
        category: category,
        is_theme: true,
        text_1: 'Save the Date',
        text_2: 'July, 10 | My event',
        appearance_attributes: {
          background_image: 'dark_wall',
          font_family_1: 'jack_story',
          font_color_1: '#fff',
          font_size_1: 24,
          font_family_2: 'jack_story',
          font_color_2: '#fff',
          font_size_2: 16
        }
      )
    end
  end

  task create_other_themes: :environment do
    category = Category.by_name('other').first
    theme = category.events.create(
      name: 'default',
      category: category,
      is_theme: true,
      text_1: 'save the data',
      text_2: 'july, 10 | my event',
      appearance_attributes: {
        background_image: 'dark_wall',
        font_family_1: 'jack_story',
        font_color_1: '#fff',
        font_size_1: 24,
        font_family_2: 'jack_story',
        font_color_2: '#fff',
        font_size_2: 16
      }
    )
  end
end