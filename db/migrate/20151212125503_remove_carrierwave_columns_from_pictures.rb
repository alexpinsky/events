class RemoveCarrierwaveColumnsFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :image_processing, :boolean
    rename_column :pictures, :image, :image_url
  end
end
