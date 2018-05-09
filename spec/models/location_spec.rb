require 'rails_helper'

RSpec.describe Location, type: :model do
  context "when there is location data" do
    let(:weather_data) {
      {
        id: 1,
        title: "Yahoo! Weather - Melbourne, VIC, AU",
        last_build_date: "Wed, 09 May 2018 04:41 PM AEST"
      }
    }
    let(:location_data) {
      {
        weather_id: 1,
        city: "Melbourne",
        country: "Australia",
        region: "VIC"
      }
    }

    it "returns the created data" do
      weather = Weather.create(weather_data)
      location = Location.create(location_data)

      expect(weather.title).to eq("Yahoo! Weather - Melbourne, VIC, AU")
      expect(weather.last_build_date).to eq("Wed, 09 May 2018 04:41 PM AEST")
      expect(weather.location.city).to eq("Melbourne")
      expect(weather.location.country).to eq("Australia")
      expect(weather.location.region).to eq("VIC")
    end
  end

  context "when there is no weather data" do
    it "returns nil values" do
      weather = Weather.create(nil)

      expect(weather.title).to be_nil
      expect(weather.last_build_date).to be_nil
      expect(weather.location).to be_nil
    end
  end
end
