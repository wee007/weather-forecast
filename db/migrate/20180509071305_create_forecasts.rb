class CreateForecasts < ActiveRecord::Migration[5.1]
  def change
    create_table :forecasts do |t|
      t.references :condition, foreign_key: true
      t.string :code, null: true
      t.string :date, null: true
      t.string :day, null: true
      t.string :high, null: true
      t.string :low, null: true
      t.string :text, null: true

      t.timestamps
    end
  end
end
