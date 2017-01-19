class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.boolean :is_active, :default => true
      t.references :user
      t.string :access_token
      t.timestamps null: false
    end
  end
end
