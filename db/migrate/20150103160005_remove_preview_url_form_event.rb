class RemovePreviewUrlFormEvent < ActiveRecord::Migration
  def up
    remove_column :events, :preview_url
  end

  def down
    add_column :events, :preview_url, :string
  end
end
