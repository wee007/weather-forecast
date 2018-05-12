# Fetch weather data from Yahoo API.
#
module Fetchable
  extend ActiveSupport::Concern

  private

  def fetch_weather city
    case city
    when "melbourne"
      Http.get "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%3D1103816&format=json"
    when "sydney"
      Http.get "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%3D1105779&format=json"
    else
      nil
    end
  end
end
