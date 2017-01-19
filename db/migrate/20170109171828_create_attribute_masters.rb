class CreateAttributeMasters < ActiveRecord::Migration
  def change
    create_table :attribute_masters do |t|
      t.boolean :is_active, :default => true
      t.string :name
      t.string :description
      t.timestamps null: false
    end
  end
end
