class AddTemplateIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :template_id, :integer
    add_index :events, :template_id
  end
end
