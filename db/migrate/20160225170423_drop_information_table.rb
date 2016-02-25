class DropInformationTable < ActiveRecord::Migration
  def up
    add_column :events, :information, :jsonb, null: false, default: '{}'
    add_index  :events, :information, using: :gin

    Information.all.each do |info|
      event = Event.find info.event_id
      event.information = info.attributes.except 'id', 'event_id', 'created_at', 'updated_at'
      event.save!
    end

    drop_table :information
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new
  end
end
