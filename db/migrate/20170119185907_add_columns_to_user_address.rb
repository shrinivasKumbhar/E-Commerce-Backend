class AddColumnsToUserAddress < ActiveRecord::Migration
  def change
    add_column :user_addresses, :full_name, :string
    add_column :user_addresses, :pincode, :string, :limit => 6
    add_column :user_addresses, :contact_no, :string, :limit => 15
  end
end
