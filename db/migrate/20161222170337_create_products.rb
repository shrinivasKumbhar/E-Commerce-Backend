class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :is_active, :default => true
      t.references :category
      t.string :name
      t.string :display_name
      t.string :description, :limit => 500
      t.decimal :price
      t.decimal :discount
      t.integer :created_by
      t.timestamps null: false
    end
  end
end
