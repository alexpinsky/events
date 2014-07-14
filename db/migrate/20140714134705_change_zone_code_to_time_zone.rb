class ChangeZoneCodeToTimeZone < ActiveRecord::Migration
  def change
    rename_column :information, :zone_code, :time_zone
    change_column :information, :time_zone, :string
  end
end
