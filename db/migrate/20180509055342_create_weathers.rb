class CreateWeathers < ActiveRecord::Migration[5.1]
  def change
    create_table :weathers do |t|
      t.string :title, comment: 'Page Title', null: true

      t.timestamps
    end
  end
end
