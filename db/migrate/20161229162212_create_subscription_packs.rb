class CreateSubscriptionPacks < ActiveRecord::Migration
  def change
    create_table :subscription_packs do |t|
      t.boolean :is_active, :default => true
      t.string :name
      t.integer :parent_pack_id
      t.timestamps null: false
    end
  end
end
