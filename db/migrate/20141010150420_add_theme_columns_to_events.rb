class AddThemeColumnsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :category_id, :integer
    add_column :events, :theme_id, :integer
    add_column :events, :is_theme, :boolean
    add_column :events, :preview_url, :string
    remove_column :events, :string
  end
end
