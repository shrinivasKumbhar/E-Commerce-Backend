class CreateSubscriptionPackages < ActiveRecord::Migration
  def change
    create_table :subscription_packages do |t|
      t.boolean :is_active, :default => true
      t.references :subscription_packs
      t.string :days
      t.decimal :price
      t.timestamps null: false
    end
  end
end
