class CreateUsersSocieties < ActiveRecord::Migration
  def change
    create_table :users_societies do |t|
      t.boolean :is_active, :default => true
      t.references :user
      t.references :society
      t.timestamps null: false
    end
  end
end
