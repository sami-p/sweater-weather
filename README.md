# Sweater Weather

## Project Description
A service-oriented architecture build by building and exposing APIs in order to provide current weather conditions for a given location, and plan a road trip with predicted arrival time forecast.


## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer

## Versions
Ruby: 2.7.2
Rails: 6.1.4

## Development
![Ruby on Rails][ruby-on-rails-badge]
![Git][git-badge]
![Atom][atom-badge]
![Faraday][faraday-badge]
![Postman][postman-badge]

## Testing
![RSpec][rspec-badge]
![Simplecov][simplecov-badge]
![VCR][vcr-badge]
![Pry][pry-badge]
![Shoulda Matchers][shoulda-matchers-badge]

## API Key Links 
(Make sure to save your API keys as the following variable names in your application.yml file)
- [maps_api](https://developer.mapquest.com/documentation/geocoding-api/)
- [weather_api](https://openweathermap.org/api/one-call-api)
- [unsplash_api](https://unsplash.com/developers)

## Schema

![Screen Shot 2021-11-17 at 7 00 35 AM](https://user-images.githubusercontent.com/79054409/142214696-07c17037-4b2c-428c-8690-71459c7d1284.png)


## Installation

1. Fork and/or clone [this repository](https://github.com/sami-p/sweater-weather)
2. Cd into your project directory 
3. Run `bundle install `
4. Run `rails db:{drop,create,migrate}`
5. Run `bundle exec figaro install`
6. Add your API keys to your `config/application.yml file`

<!-- Markdown link & img dfn's -->
[linkedin-badge]:         https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white

[atom-badge]:             https://img.shields.io/badge/Atom-66595C.svg?&style=flaste&logo=atom&logoColor=white
[git-badge]:              https://img.shields.io/badge/Git-F05032.svg?&style=flaste&logo=git&logoColor=white
[github-badge]:           https://img.shields.io/badge/GitHub-181717.svg?&style=flaste&logo=github&logoColor=white
[markdown-badge]:         https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white
[postman-badge]:          https://img.shields.io/badge/Postman-FF6C37?style=flat&logo=Postman&logoColor=white
[ruby-on-rails-badge]:    https://img.shields.io/badge/Ruby%20On%20Rails-b81818.svg?&style=flat&logo=rubyonrails&logoColor=white

<!-- Testing -->
[pry-badge]:              https://img.shields.io/badge/pry-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[rspec-badge]:            https://img.shields.io/badge/rspec-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[shoulda-matchers-badge]: https://img.shields.io/badge/shoulda--matchers-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[simplecov-badge]:        https://img.shields.io/badge/simplecov-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
[vcr-badge]:              https://img.shields.io/badge/vcr-b81818.svg?&style=flaste&logo=rubygems&logoColor=white
