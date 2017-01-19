class AddColumnUserIdToOtpStore < ActiveRecord::Migration
  def change
    add_column :otp_stores, :user_id, :integer
  end
end
