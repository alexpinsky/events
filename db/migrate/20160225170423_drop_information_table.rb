class DropInformationTable < ActiveRecord::Migration
  def change
    drop_table :information
  end
end
