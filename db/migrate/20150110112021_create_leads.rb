class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :email
      t.string :assigned
      t.string :status

      t.timestamps
    end
  end
end
