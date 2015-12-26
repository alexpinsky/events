class RemoveSlideshowFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :slideshow, :boolean
  end
end
