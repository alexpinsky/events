class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :thumbnail_url
      t.integer :category_id
    end
    add_index :templates, :category_id
  end
end
