class CreateSocialProviders < ActiveRecord::Migration
  def change
    create_table :social_providers do |t|
      t.integer :type_enum
      t.integer :user_id
      t.string :token
      t.string :expires_at
    end
    add_index :social_providers, :type_enum
    add_index :social_providers, :user_id
  end
end
