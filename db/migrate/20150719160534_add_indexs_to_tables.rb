class AddIndexsToTables < ActiveRecord::Migration
  def change
    add_index :events, :url
    add_index :events, :user_id
    add_index :appearances, :event_id
    add_index :information, :event_id
    add_index :pictures, :displayable_id
    add_index :pictures, :displayable_type
  end
end
