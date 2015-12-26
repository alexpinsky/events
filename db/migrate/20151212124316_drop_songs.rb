class DropSongs < ActiveRecord::Migration
  def change
    drop_table :songs
  end
end
