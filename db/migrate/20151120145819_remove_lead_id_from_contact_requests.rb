class RemoveLeadIdFromContactRequests < ActiveRecord::Migration
  def up
    remove_index  :contact_requests, :lead_id
    remove_column :contact_requests, :lead_id, :integer
  end

  def down
    add_column :contact_requests, :lead_id, :integer
    add_index :contact_requests, :lead_id
  end
end
