# Weather Forecast

## Context

The app is built using Ruby 2.5.0 and Rails 5.1.6, and bootstrap 4.1.1.

It shows the weather forecast for a selected location using Yahoo API endpoints - Currently only Sydney and Melbourne are available for selection.

It also stores the weather info in the database each time the weather forecast is viewed upon selecting a location. Only some weather info are shown for demo purpose but other info can be used for future development.

## Getting Started

Create the databases

`createdb weather_forecast_development`

`createdb weather_forecast_test`

Run the database migration

`rake db:migrate`

Start up the app

`rails s`

Go to the root URL (e.g. localhost:3000) to access the home page and select a location to see the weather forecast.

You can run the test specs via `rspec` and a coverage report `index.html` will be created under the `coverage` directory.

The demo can also be seen at https://w3ather-forecast.herokuapp.com/.
