require 'rails_helper'

RSpec.describe Weather, type: :model do
  context "when there is weather data" do
    let(:data) {
      {
        title: "Yahoo! Weather - Melbourne, VIC, AU",
        last_build_date: "Wed, 09 May 2018 04:41 PM AEST"
      }
    }

    it "returns the created data" do
      weather = Weather.create(data)

      expect(weather.title).to eq("Yahoo! Weather - Melbourne, VIC, AU")
      expect(weather.last_build_date).to eq("Wed, 09 May 2018 04:41 PM AEST")
    end
  end

  context "when there is no weather data" do
    it "returns nil values" do
      weather = Weather.create(nil)

      expect(weather.title).to be_nil
      expect(weather.last_build_date).to be_nil
    end
  end
end
