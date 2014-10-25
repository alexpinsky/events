require 'spec_helper'

describe Event do

  describe "ClassMethods" do

    describe "create_from_theme" do
      let(:category) { create(:category) }
      let(:theme) { create(:theme, category: category) }
      let!(:appearance) { create(:appearance, event: theme) }
      let(:user) { create(:user) }

      subject(:create_from_theme) { Event.create_from_theme(user: user, category: category, theme: theme) }

      it "should create and return a copy of the theme with the proper fields" do
        new_event = create_from_theme
        expect(new_event.user_id).to eq(user.id)
        expect(new_event.name).to be_blank
        expect(new_event.text_1).to eq(theme.text_1)
        expect(new_event.text_2).to eq(theme.text_2)
        expect(new_event.text_3).to eq(theme.text_3)
        expect(new_event.text_4).to eq(theme.text_4)
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
  end
end