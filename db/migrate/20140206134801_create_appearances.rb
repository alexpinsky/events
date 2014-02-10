class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.string :background_image
      t.string :font_family
      t.string :font_color

      t.timestamps
    end
  end
end
