namespace :categories do
  
  task create: :environment do
    Category.by_name('wedding').first || Category.create!(name: 'wedding')
    Category.by_name('celebration').first || Category.create!(name: 'celebration')
    Category.by_name('meetups').first || Category.create!(name: 'meetups')
    Category.by_name('whatever').first || Category.create!(name: 'whatever')
  end
end