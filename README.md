# CLI Weather

## Description

CLI Weather is a Ruby CLI application returns the National Weather Service forecast based on an address value input by the user. The user is invited to interact with the application to choose how the weather information is retrieved - by zip code, by city/state, or by full address.  

I used the forecast page for my location in [Bloomington MN](https://forecast.weather.gov/MapClick.php?lat=44.8292&lon=-93.3448&unit=0&lg=english&FcstType=digital). My original goal was to scrape the Tabular Forecast for a locality but the data is not well-labeled for easy scraping. As a runner, I keep my eye on the forecast by hour so I can anticipate how the weather will feel and whether the road surface is dry or slippery. This project idea allowed me to play with that weather data.

This project is protected under the [MIT License](https://github.com/kristenkinnearohlmann/cli-weather/blob/main/LICENSE).

## Project Information

The project has the following dependencies:
- httparty (gem): [https://github.com/jnunemaker/httparty](https://github.com/jnunemaker/httparty): This gem is used to connect with APIs.  
- positionstack (API): [https://positionstack.com/](https://positionstack.com/): This API provides geolocation information based on address input. Requires key (free).  
- Rake (gem): [https://github.com/ruby/rake](https://github.com/ruby/rake): This gem allows the application to run for testing.  
- rspec (gem): [http://rspec.info/](http://rspec.info/): This gem is a test runner.  

The general process flow is diagrammed as a [Lucid chart](https://lucid.app/lucidchart/a1ba7fa3-fd50-47c9-bd5f-3d866e30d0f3/edit?beaconFlowId=EFFA9CE54CF62CE1&page=0_0#). The main classes used in processing:

- **DisplayWeather**  
Runs the application
- **Address**  
Gets and confirms (as best as possible) the address
- **Weather**  
Holds the Weather object and things the Weather object does
- **Geolocation**  
Performs the lookup based on selected address
- **Scraper**  
Gets the data from the source (currently only NWS)
## Install Instructions

This project can be cloned and run from the command line within the `cli-weather` folder:  
`./bin/weather`

## Contributor Guide

Future enhancements include:  
- Using the [NWS API](https://www.weather.gov/documentation/services-web-api)
- Add other weather websites as options
- Add other weather APIs as options

Please contact me on [GitHub](https://github.com/kristenkinnearohlmann) if you are interested in contributing. I will reach out once I have completed a detailed contributor guide for the project.
