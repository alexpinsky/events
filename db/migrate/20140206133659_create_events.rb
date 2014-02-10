class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.integer :duration
      t.string :title
      t.text :description
      t.string :url
      t.datetime :closing_date

      t.timestamps
    end
  end
end
