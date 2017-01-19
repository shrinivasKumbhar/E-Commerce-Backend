class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.boolean :is_active, :default => true
      t.references :user
      t.references :product
      t.decimal :quantity
      t.timestamps null: false
    end
  end
end
