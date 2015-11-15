class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.integer :event_id
      t.string  :ip
      t.string  :referer

      t.timestamps
    end
    add_index :views, :event_id
  end
end
