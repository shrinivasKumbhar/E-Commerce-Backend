class CreateUserAddresses < ActiveRecord::Migration
  def change
    create_table :user_addresses do |t|
      t.boolean :is_active, :default => true
      t.references :user
      t.references :society
      t.string :address1
      t.string :address2
      t.timestamps null: false
    end
  end
end
