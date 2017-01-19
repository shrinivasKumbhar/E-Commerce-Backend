class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.boolean :is_active, :default => true
      t.references :area
      t.string :name
      t.string :description
      t.timestamps null: false
    end
  end
end
