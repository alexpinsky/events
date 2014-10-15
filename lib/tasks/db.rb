namespace :db do

  desc ''
  task create_themes: :environment do
    categories_names = ['wedding', 'birthday', 'party', 'other']
    categories_names.each do |category_name|
      category = Category.create(name: category_name)
      
    end
  end
end