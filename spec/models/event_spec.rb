require 'spec_helper'

describe Event do

  describe "ClassMethods" do

    describe "create_from_theme" do
      

      shared_examples "a copy from theme" do

        it "should create and return a copy of the theme with the proper fields" do
          expect(new_event.user_id).to eq(user.id)
          expect(new_event.name).to be_blank
          expect(new_event.text_1).to eq(theme.text_1)
          expect(new_event.text_2).to eq(theme.text_2)
          expect(new_event.text_3).to eq(theme.text_3)
          expect(new_event.text_4).to eq(theme.text_4)
          expect(new_event.url).to not_eq(theme.url)
          expect(new_event.url_hash).to not_eq(theme.url_hash)
          expect(new_event.category_id).to eq(theme.category_id)
          expect(new_event.theme_id).to eq(theme.id)
          expect(new_event.is_theme).to eq(false)
          new_appearance = new_event.appearance
          expect(new_appearance.background_image).to eq(appearance.background_image)
          expect(new_appearance.font_family_1).to eq(appearance.font_family_1)
          expect(new_appearance.font_family_2).to eq(appearance.font_family_2)
          expect(new_appearance.font_family_3).to eq(appearance.font_family_3)
          expect(new_appearance.font_family_4).to eq(appearance.font_family_4)
          expect(new_appearance.font_color_1).to eq(appearance.font_color_1)
          expect(new_appearance.font_color_2).to eq(appearance.font_color_2)
          expect(new_appearance.font_color_3).to eq(appearance.font_color_3)
          expect(new_appearance.font_color_4).to eq(appearance.font_color_4)
          expect(new_appearance.font_size_1).to eq(appearance.font_size_1)
          expect(new_appearance.font_size_2).to eq(appearance.font_size_2)
          expect(new_appearance.font_size_3).to eq(appearance.font_size_3)
          expect(new_appearance.font_size_4).to eq(appearance.font_size_4)
        end
      end

      context "when a theme is provided" do
        it_should_behave_like "a copy from theme"
      end

      context "when a theme is NOT provided" do
        it_should_behave_like "a copy from theme"
      end
    end
  end
end