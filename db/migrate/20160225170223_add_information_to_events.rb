class AddInformationToEvents < ActiveRecord::Migration
  def up
    add_column :events, :information, :jsonb, null: false, default: '{}'
    add_index  :events, :information, using: :gin

    Event.reset_column_information

    Information.all.each do |info|
      event = Event.where(id: info.event_id).first
      event.update_attribute(
        :information,
        info.attributes.except('id', 'event_id', 'created_at', 'updated_at')
      ) if event
    end
  end

  def down
    remove_column :events, :information
  end
end
