FactoryGirl.define do
  factory :lead do
    email { Faker::Internet.email }
  end
end