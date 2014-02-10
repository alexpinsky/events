class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :displayable_id
      t.string :displayable_type
      t.string :image

      t.timestamps
    end
  end
end
