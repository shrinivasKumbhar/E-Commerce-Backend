class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.boolean :is_active, :default => true
      t.string :name
      t.string :pincode, :limit => 6
      t.timestamps null: false
    end
  end
end
