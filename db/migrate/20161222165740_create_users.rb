class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :is_active, :default => true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :mobile_no, :limit => 15
      t.string :signup_type, :limit => 5
      t.string :password, :limit => 500
      t.string :password_salt, :limit => 500
      t.string :password_hash, :limit => 500
      t.timestamps null: false
    end
  end
end
