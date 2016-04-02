class AddInformationToEvents < ActiveRecord::Migration
  def up
    add_column :events, :information, :jsonb, null: false, default: '{}'
    add_index  :events, :information, using: :gin

    Event.reset_column_information

    Information.all.each do |info|
      event = Event.where(id: info.event_id).first
      next unless event

      information = {
        in_use: info.in_use,
        summary: info.summary,
        location: info.location,
        start_time: info.start_time.to_i * 1000,
        end_time: info.end_time.to_i * 1000
      }

      event.information = information
      event.save
    end
  end

  def down
    remove_column :events, :information
  end
end
