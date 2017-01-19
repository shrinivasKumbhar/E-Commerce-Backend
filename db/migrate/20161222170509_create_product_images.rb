class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
      t.boolean :is_active, :default => true
      t.references :product
      t.string :image_url
      t.string :thumb_image_url
      t.integer :created_by
      t.timestamps null: false
    end
  end
end
