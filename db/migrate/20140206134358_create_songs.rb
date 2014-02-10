class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :listenable_id
      t.string :listenable_type
      t.string :audio

      t.timestamps
    end
  end
end
