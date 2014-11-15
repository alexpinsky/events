class AddOrderToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :order, :integer
  end
end
