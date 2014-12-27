class ChangeFontSizeTypeInAppearance < ActiveRecord::Migration
  def up
    change_column :appearances, :font_size_1, :string
    change_column :appearances, :font_size_2, :string
    change_column :appearances, :font_size_3, :string
    change_column :appearances, :font_size_4, :string
  end

  def down
    change_column :appearances, :font_size_1, :integer
    change_column :appearances, :font_size_2, :integer
    change_column :appearances, :font_size_3, :integer
    change_column :appearances, :font_size_4, :integer
  end
end
