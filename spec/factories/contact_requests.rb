FactoryGirl.define do
  factory :contact_request do
    email   { Faker::Internet.email }
    message { Faker::Lorem.sentence(4) }
  end

  factory :invalid_contact_request, class: ContactRequest do
    email   { 'NOT AN EMAIL' }
    message { Faker::Lorem.sentence(4) }
  end
end