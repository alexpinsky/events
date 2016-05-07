class AddTextsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :texts, :jsonb, null: false, default: '{}'
    add_index  :events, :texts, using: :gin
  end
end
