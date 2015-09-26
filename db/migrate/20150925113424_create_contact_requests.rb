class CreateContactRequests < ActiveRecord::Migration
  def change
    create_table :contact_requests do |t|
      t.integer :lead_id
      t.string  :email
      t.text    :message

      t.timestamps
    end
    add_index :contact_requests, :lead_id
  end
end
