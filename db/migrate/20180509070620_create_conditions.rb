class CreateConditions < ActiveRecord::Migration[5.1]
  def change
    create_table :conditions do |t|
      t.references :weather, foreign_key: true
      t.string :title, null: true
      t.string :description, null: true
      t.string :lat, null: true
      t.string :long, null: true
      t.string :code, null: true
      t.string :date, null: true
      t.string :temp, null: true
      t.string :text, null: true

      t.timestamps
    end
  end
end
