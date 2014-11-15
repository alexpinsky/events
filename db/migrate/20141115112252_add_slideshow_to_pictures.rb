class AddSlideshowToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :slideshow, :boolean
  end
end
