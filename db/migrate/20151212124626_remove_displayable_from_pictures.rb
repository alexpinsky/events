class RemoveDisplayableFromPictures < ActiveRecord::Migration
  def up
    add_column :pictures, :event_id, :integer
    add_index :pictures, :event_id
    Picture.all.each do |pic|
      pic.update_column :event_id, pic.displayable_id
    end
    remove_column :pictures, :displayable_id
    remove_column :pictures, :displayable_type
  end

  def down
    add_column :pictures, :displayable_type, :string
    add_column :pictures, :displayable_id, :integer
    Picture.all.each do |pic|
      pic.update_column :displayable_id, pic.event_id
      pic.update_column :displayable_type, 'Event'
    end
    remove_column :pictures, :event_id
  end
end
