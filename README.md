# CLI Weather

## Description

This Ruby CLI application returns the National Weather Service forecast based on an input address value. The user is invited to interact with the application to choose how the weather information is retrieved.

## Project Dependencies

httparty (gem): [https://github.com/jnunemaker/httparty](https://github.com/jnunemaker/httparty): This gem is used to connect with APIs.  

positionstack (API): [https://positionstack.com/](https://positionstack.com/): This API provides geolocation information based on address input. Requires key (free).  

Rake (gem): [https://github.com/ruby/rake](https://github.com/ruby/rake): This gem allows the application to run for testing.  

rspec (gem): [http://rspec.info/](http://rspec.info/): This gem is a test runner.  

## Snippets
National Weather Service URL parms
        # @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}&unit=0&lg=english&FcstType=digital" # data table did not really have enough to parse easily, return to this in the future
        @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}"

Bloomington MN
https://forecast.weather.gov/MapClick.php?lat=44.8292&lon=-93.3448&unit=0&lg=english&FcstType=digital

## Working Ideas

DisplayWeather (class)  
Runs the application

Address (class)  
Gets and confirms (as best as possible) the address

Weather (class)  
Holds the Weather object and things the Weather object does

Geolocation (class)  
Performs the lookup based on selected address

Scraper (class)  
Gets the data from the source (currently only NWS)

## Future
Investigate using NWS API https://www.weather.gov/documentation/services-web-api

## Hold
02-07-2021: Figured out the trouble spot and blasted into the end of Draft 2. Whee!!!!
02-06-2021: Started to figure out the trouble spot.