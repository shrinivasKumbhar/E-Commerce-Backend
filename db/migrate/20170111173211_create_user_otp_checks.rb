class CreateUserOtpChecks < ActiveRecord::Migration
  def change
    create_table :user_otp_checks do |t|

      t.timestamps null: false
    end
  end
end
