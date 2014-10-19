class ChangeAppearanceFields < ActiveRecord::Migration
  def change
    rename_column :appearances, :font_family, :font_family_1
    rename_column :appearances, :font_color, :font_color_1
    rename_column :appearances, :presentable_id, :event_id
    add_column :appearances, :font_size_1, :integer
    add_column :appearances, :font_family_2, :string
    add_column :appearances, :font_color_2, :string
    add_column :appearances, :font_size_2, :integer
    add_column :appearances, :font_family_3, :string
    add_column :appearances, :font_color_3, :string
    add_column :appearances, :font_size_3, :integer
    add_column :appearances, :font_family_4, :string
    add_column :appearances, :font_color_4, :string
    add_column :appearances, :font_size_4, :integer
    remove_column :appearances, :presentable_type
  end
end
