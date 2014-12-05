class AddInUseToInformation < ActiveRecord::Migration
  def change
    add_column :information, :in_use, :boolean
  end
end
