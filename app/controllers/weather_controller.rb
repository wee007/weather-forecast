class WeatherController < ApplicationController
  def index
    result = Http.get "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%3D1103816&format=json"
    render json: MultiJson.load(result.body), status: result.status
  rescue => error
    render json: { error: error }
  end
end
