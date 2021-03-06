require 'rails_helper'

RSpec.describe Condition, type: :model do
  context "when there is condition data" do
    let(:weather_data) {
      {
        id: 1,
        title: "Yahoo! Weather - Melbourne, VIC, AU",
        last_build_date: "Wed, 09 May 2018 04:41 PM AEST"
      }
    }
    let(:condition_data) {
      {
        weather_id: 1,
        title: "Conditions for Melbourne, VIC, AU at 04:00 PM AEST",
        lat: "-37.865799",
        long: "145.102829",
        description: '<![CDATA[<img src="http://l.yimg.com/a/i/us/we/52/28.gif"/> <BR /> <b>Current Conditions:</b> <BR />Mostly Cloudy <BR /> <BR /> <b>Forecast:</b> <BR /> Wed - Showers. High: 64Low: 48 <BR /> Thu - Showers. High: 53Low: 45 <BR /> Fri - Showers. High: 55Low: 44 <BR /> Sat - Mostly Sunny. High: 57Low: 49 <BR /> Sun - Mostly Cloudy. High: 58Low: 50 <BR /> <BR /> <a href="http://us.rd.yahoo.com/dailynews/rss/weather/Country__Country/*https://weather.yahoo.com/country/state/city-1103816/">Full Forecast at Yahoo! Weather</a> <BR /> <BR /> <BR /> ]]>',
        code: "28",
        date: "Wed, 09 May 2018 04:00 PM AEST",
        temp: "64",
        text: "Mostly Cloudy"
      }
    }

    it "returns the created data" do
      weather = Weather.create(weather_data)
      condition = Condition.create(condition_data)

      expect(weather.title).to eq("Yahoo! Weather - Melbourne, VIC, AU")
      expect(weather.last_build_date).to eq("Wed, 09 May 2018 04:41 PM AEST")
      expect(weather.condition.title).to eq("Conditions for Melbourne, VIC, AU at 04:00 PM AEST")
      expect(weather.condition.lat).to eq("-37.865799")
      expect(weather.condition.long).to eq("145.102829")
      expect(weather.condition.description).to eq('<![CDATA[<img src="http://l.yimg.com/a/i/us/we/52/28.gif"/> <BR /> <b>Current Conditions:</b> <BR />Mostly Cloudy <BR /> <BR /> <b>Forecast:</b> <BR /> Wed - Showers. High: 64Low: 48 <BR /> Thu - Showers. High: 53Low: 45 <BR /> Fri - Showers. High: 55Low: 44 <BR /> Sat - Mostly Sunny. High: 57Low: 49 <BR /> Sun - Mostly Cloudy. High: 58Low: 50 <BR /> <BR /> <a href="http://us.rd.yahoo.com/dailynews/rss/weather/Country__Country/*https://weather.yahoo.com/country/state/city-1103816/">Full Forecast at Yahoo! Weather</a> <BR /> <BR /> <BR /> ]]>')
      expect(weather.condition.code).to eq("28")
      expect(weather.condition.date).to eq("Wed, 09 May 2018 04:00 PM AEST")
      expect(weather.condition.temp).to eq("64")
      expect(weather.condition.text).to eq("Mostly Cloudy")
    end
  end

  context "when there is no weather data" do
    it "returns nil values" do
      weather = Weather.create(nil)

      expect(weather.title).to be_nil
      expect(weather.last_build_date).to be_nil
      expect(weather.condition).to be_nil
    end
  end
end
