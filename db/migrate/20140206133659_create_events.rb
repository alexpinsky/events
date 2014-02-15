class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.string :primary_text
      t.string :secondary_text
      t.text :extra_text
      t.string :url
      t.string :url_hash
      t.string :string

      t.timestamps
    end
  end
end
