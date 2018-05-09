require 'rails_helper'

RSpec.describe Atmosphere, type: :model do
  context "when there is wind data" do
    let(:weather_data) {
      {
        id: 1,
        title: "Yahoo! Weather - Melbourne, VIC, AU",
        last_build_date: "Wed, 09 May 2018 04:41 PM AEST"
      }
    }
    let(:atmosphere_data) {
      {
        weather_id: 1,
        humidity: "45",
        pressure: "1009.0",
        rising: "0",
        visibility: "16.1"
      }
    }

    it "returns the created data" do
      weather = Weather.create(weather_data)
      atmosphere = Atmosphere.create(atmosphere_data)

      expect(weather.title).to eq("Yahoo! Weather - Melbourne, VIC, AU")
      expect(weather.last_build_date).to eq("Wed, 09 May 2018 04:41 PM AEST")
      expect(weather.atmosphere.humidity).to eq("45")
      expect(weather.atmosphere.pressure).to eq("1009.0")
      expect(weather.atmosphere.rising).to eq("0")
      expect(weather.atmosphere.visibility).to eq("16.1")
    end
  end

  context "when there is no weather data" do
    it "returns nil values" do
      weather = Weather.create(nil)

      expect(weather.title).to be_nil
      expect(weather.last_build_date).to be_nil
      expect(weather.atmosphere).to be_nil
    end
  end
end
