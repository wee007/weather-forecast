class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.references :weather, foreign_key: true
      t.string :city, null: true
      t.string :country, null: true
      t.string :region, null: true

      t.timestamps
    end
  end
end
