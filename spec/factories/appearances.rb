FactoryGirl.define do
  factory :appearance do
    background_image "background_image"
    font_family_1 "font_family_1"
    font_color_1 "font_color_1"
    font_size_1 24
    font_family_2 "font_family_2"
    font_color_2 "font_color_2"
    font_size_2 16
    font_family_3 "font_family_3"
    font_color_3 "font_color_3"
    font_size_3 14
    font_family_4 "font_family_4"
    font_color_4 "font_color_4"
    font_size_4 14
    association :event, factory: :event
  end
end