class WeathersController < ApplicationController
  include Fetchable
  include Insertable

  before_action :fetch_by_city, only: [:show, :create]

  # Insert weather data in the database
  # and return weather data.
  #
  def create
    if @weather.present?
      data = Weather.structure @weather
      insert_weather data
    end

    render :show
  end

  private

  def fetch_by_city
    city = params[:city]
    response = fetch_weather city
    response_body = MultiJson.load response.body
    @weather = response_body.dig("query", "results", "channel")
  rescue => error
    logger.error error
    flash[:error] = t "controllers.error"

    render :show, status: :internal_server_error
  end
end
