class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.boolean :is_active, :default => true
      t.string :name, :limit => 20
      t.integer :created_by
      t.timestamps null: false
    end
  end
end
