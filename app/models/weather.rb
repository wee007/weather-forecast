class Weather < ApplicationRecord
  has_one :location
  has_one :wind
  has_one :atmosphere
  has_one :astronomy
  has_one :condition

  def self.structure data
    {
      title: data["title"],
      last_build_date: data["lastBuildDate"],
      location: {
        city: data.dig("location", "city"),
        country: data.dig("location", "country"),
        region: data.dig("location", "region").try("strip")
      },
      wind: {
        chill: data.dig("wind", "chill"),
        direction: data.dig("wind", "direction"),
        speed: data.dig("wind", "speed")
      },
      atmosphere: {
        humidity: data.dig("atmosphere", "humidity"),
        pressure: data.dig("atmosphere", "pressure"),
        rising: data.dig("atmosphere", "rising"),
        visibility: data.dig("atmosphere", "visibility")
      },
      astronomy: {
        sunrise: data.dig("astronomy", "sunrise"),
        sunset: data.dig("astronomy", "sunset")
      },
      condition: {
        title: data.dig("item", "title"),
        description: data.dig("item", "description"),
        lat: data.dig("item", "lat"),
        long: data.dig("item", "long"),
        code: data.dig("item", "condition", "code"),
        date: data.dig("item", "condition", "date"),
        temp: data.dig("item", "condition", "temp"),
        text: data.dig("item", "condition", "text")
      },
      forecasts: [
        data.dig("item", "forecast").map do |forecast|
          {
            code: forecast["code"],
            date: forecast["date"],
            day: forecast["day"],
            high: forecast["high"],
            low: forecast["low"],
            text: forecast["text"]
          }
        end
      ]
    }
  end
end
