class AddIsProfileToProductImage < ActiveRecord::Migration
  def change
    add_column :product_images, :is_profile, :boolean, :default => false
  end
end
