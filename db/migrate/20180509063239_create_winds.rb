class CreateWinds < ActiveRecord::Migration[5.1]
  def change
    create_table :winds do |t|
      t.references :weather, foreign_key: true
      t.string :chill, null: true
      t.string :direction, null: true
      t.string :speed, null: true

      t.timestamps
    end
  end
end
