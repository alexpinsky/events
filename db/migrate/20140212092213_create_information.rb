class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :event_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :zone_code
      t.string :summary
      t.string :location
      t.string :organizer
      t.string :organizer_email
      t.string :date_format

      t.timestamps
    end
  end
end
