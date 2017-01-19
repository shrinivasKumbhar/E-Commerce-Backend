class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.boolean :is_active
      t.string :name
      t.integer :parent_category_id
      t.integer :created_by
      t.timestamps null: false
    end
  end
end
