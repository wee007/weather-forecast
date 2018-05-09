class CreateAtmospheres < ActiveRecord::Migration[5.1]
  def change
    create_table :atmospheres do |t|
      t.references :weather, foreign_key: true
      t.string :humidity
      t.string :pressure
      t.string :rising
      t.string :visibility

      t.timestamps
    end
  end
end
