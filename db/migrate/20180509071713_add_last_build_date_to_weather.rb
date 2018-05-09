class AddLastBuildDateToWeather < ActiveRecord::Migration[5.1]
  def change
    add_column :weathers, :last_build_date, :string, null: true
  end
end
