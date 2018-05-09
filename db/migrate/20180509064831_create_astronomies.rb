class CreateAstronomies < ActiveRecord::Migration[5.1]
  def change
    create_table :astronomies do |t|
      t.references :weather, foreign_key: true
      t.string :sunrise, null: true
      t.string :sunset, null: true

      t.timestamps
    end
  end
end
