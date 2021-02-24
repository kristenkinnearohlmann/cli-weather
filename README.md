# CLI Weather

## Description

This Ruby CLI application returns the National Weather Service forecast based on an input address value. The user is invited to interact with the application to choose how the weather information is retrieved.  

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

This project can be cloned and run from the command line:  
`ruby bin/weather`

## Contributor Guide

Future enhancements include:  
- Using the [NWS API](https://www.weather.gov/documentation/services-web-api)
- Add other weather websites as options
- Add other weather APIs as options

Please contact me on [GitHub](https://github.com/kristenkinnearohlmann) if you are interested in contributing. I will reach out once I have completed a detailed contributor guide for the project.

## Snippets
National Weather Service URL parms
        # @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}&unit=0&lg=english&FcstType=digital" # data table did not really have enough to parse easily, return to this in the future
        @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}"

Bloomington MN
https://forecast.weather.gov/MapClick.php?lat=44.8292&lon=-93.3448&unit=0&lg=english&FcstType=digital