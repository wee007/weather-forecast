# Insert weather data into database.
#
module Insertable
  extend ActiveSupport::Concern

  private

  def insert_weather data
    weather = Weather.new title: data[:title], last_build_date: data[:lastBuildDate]
    weather.build_location data[:location]
    weather.build_wind data[:wind]
    weather.build_atmosphere data[:atmosphere]
    weather.build_astronomy data[:astronomy]
    weather.build_condition data[:condition]
    weather.condition.forecasts.build data[:forecasts]
    weather.save!
  end
end
