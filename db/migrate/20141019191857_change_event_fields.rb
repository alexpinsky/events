class ChangeEventFields < ActiveRecord::Migration
  def change
    rename_column :events, :primary_text, :text_1
    rename_column :events, :secondary_text, :text_2
    rename_column :events, :extra_text, :text_3
    add_column :events, :text_4, :string
  end
end
