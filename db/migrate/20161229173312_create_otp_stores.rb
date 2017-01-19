class CreateOtpStores < ActiveRecord::Migration
  def change
    create_table :otp_stores do |t|
      t.boolean :is_active, :default => true
      t.string :contact_no, :limit => 15
      t.string :otp, :limit => 8
      t.timestamps null: false
    end
  end
end
