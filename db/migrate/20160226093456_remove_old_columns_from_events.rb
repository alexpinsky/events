class RemoveOldColumnsFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :text_1, :string
    remove_column :events, :text_2, :string
    remove_column :events, :text_3, :string
    remove_column :events, :text_4, :string
    remove_column :events, :url_hash, :string
  end
end
