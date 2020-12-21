# CLI Weather

## Project Dependencies

httparty (gem): [https://github.com/jnunemaker/httparty](https://github.com/jnunemaker/httparty)  

positionstack (API): [https://positionstack.com/](https://positionstack.com/)

Rake (gem): [https://github.com/ruby/rake](https://github.com/ruby/rake)

rspec (gem): [http://rspec.info/](http://rspec.info/)

## Snippets
National Weather Service URL parms
        # @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}&unit=0&lg=english&FcstType=digital" # data table did not really have enough to parse easily, return to this in the future
        @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}"

Bloomington MN
https://forecast.weather.gov/MapClick.php?lat=44.8292&lon=-93.3448&unit=0&lg=english&FcstType=digital

## Future
Investigate using NWS API https://www.weather.gov/documentation/services-web-api