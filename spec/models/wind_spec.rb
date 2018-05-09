require 'rails_helper'

RSpec.describe Wind, type: :model do
  context "when there is wind data" do
    let(:weather_data) {
      {
        id: 1,
        title: "Yahoo! Weather - Melbourne, VIC, AU",
        last_build_date: "Wed, 09 May 2018 04:41 PM AEST"
      }
    }
    let(:wind_data) {
      {
        weather_id: 1,
        chill: "64",
        direction: "315",
        speed: "14"
      }
    }

    it "returns the created data" do
      weather = Weather.create(weather_data)
      wind = Wind.create(wind_data)

      expect(weather.title).to eq("Yahoo! Weather - Melbourne, VIC, AU")
      expect(weather.last_build_date).to eq("Wed, 09 May 2018 04:41 PM AEST")
      expect(weather.wind.chill).to eq("64")
      expect(weather.wind.direction).to eq("315")
      expect(weather.wind.speed).to eq("14")
    end
  end

  context "when there is no weather data" do
    it "returns nil values" do
      weather = Weather.create(nil)

      expect(weather.title).to be_nil
      expect(weather.last_build_date).to be_nil
      expect(weather.wind).to be_nil
    end
  end
end
