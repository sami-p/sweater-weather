# Sweater Weather

## Project Description: 
A service-oriented architecture build by building and exposing APIs in order to provide current weather conditions for a given location, and plan a road trip with predicted arrival time forecast.


## Learning Goals: 
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Ruby version: 2.7.2

## API Key Links 
(Make sure to save your API keys as the following variable names in your application.yml file)
- [maps_api](https://developer.mapquest.com/documentation/geocoding-api/)
- [weather_api](https://openweathermap.org/api/one-call-api)
- [unsplash_api](https://unsplash.com/developers)

## Schema

![Screen Shot 2021-11-17 at 7 00 35 AM](https://user-images.githubusercontent.com/79054409/142214696-07c17037-4b2c-428c-8690-71459c7d1284.png)


## Installation

1. Fork and/or clone ![this repository](https://github.com/sami-p/sweater-weather)
2. Cd into your project directory 
3. Run bundle install 
4. Run rails db:{drop,create,migrate}
5. Run bundle exec figaro install
6. Add your API keys to your config/application.yml file
