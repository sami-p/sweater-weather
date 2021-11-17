# Sweater Weather

Project Description: A service-oriented architecture to provide current weather conditions for a given locations, and plan a road trip with predicted arrival time                      forecast.


Learning Goals: 
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

* Ruby version: 2.7.2

* API Key Links (Make sure to save your API keys as the following variable names in your application.yml file)
- ![maps_api](https://developer.mapquest.com/documentation/geocoding-api/)
- ![weather_api](https://openweathermap.org/api/one-call-api)
- ![unsplash_api](https://unsplash.com/developers)

* Schema
![Screen Shot 2021-11-17 at 6 52 24 AM](https://user-images.githubusercontent.com/79054409/142213250-e3832cd8-b040-4402-aefc-e2fced9d05bc.png)

* Installation

1. Fork and/or clone ![this repository](https://github.com/sami-p/sweater-weather)
2. Cd into your project directory 
3. Run bundle install 
4. Run rails db:{drop,create,migrate}
5. Run bundle exec figaro install
6. Add your API keys to your config/application.yml file
