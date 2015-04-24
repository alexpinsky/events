FactoryGirl.define do
  factory :theme, class: Event do
    name { Faker::Lorem.word }
    is_theme { true }
    text_1 { Faker::Lorem.sentence(3) }
    text_2 { Faker::Lorem.sentence(4) }
    text_3 { Faker::Lorem.sentence(4) }
    text_4 { Faker::Lorem.sentence(4) }
    association :category, factory: :category
  end

  factory :event do
    name { Faker::Lorem.word }
    is_theme { false }
    text_1 { Faker::Lorem.sentence(3) }
    text_2 { Faker::Lorem.sentence(4) }
    text_3 { Faker::Lorem.sentence(4) }
    text_4 { Faker::Lorem.sentence(4) }
    association :category, factory: :category
    association :user, factory: :user
  end
end