require 'rails_helper'

RSpec.describe Astronomy, type: :model do
  context "when there is astronomy data" do
    let(:weather_data) {
      {
        id: 1,
        title: "Yahoo! Weather - Melbourne, VIC, AU",
        last_build_date: "Wed, 09 May 2018 04:41 PM AEST"
      }
    }
    let(:astronomy_data) {
      {
        weather_id: 1,
        sunrise: "7:8 am",
        sunset: "5:24 pm"
      }
    }

    it "returns the created data" do
      weather = Weather.create(weather_data)
      astronomy = Astronomy.create(astronomy_data)

      expect(weather.title).to eq("Yahoo! Weather - Melbourne, VIC, AU")
      expect(weather.last_build_date).to eq("Wed, 09 May 2018 04:41 PM AEST")
      expect(weather.astronomy.sunrise).to eq("7:8 am")
      expect(weather.astronomy.sunset).to eq("5:24 pm")
    end
  end

  context "when there is no weather data" do
    it "returns nil values" do
      weather = Weather.create(nil)

      expect(weather.title).to be_nil
      expect(weather.last_build_date).to be_nil
      expect(weather.astronomy).to be_nil
    end
  end
end
