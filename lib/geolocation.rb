require 'httparty'

class Geolocation

    # How can this be hidden from GitHub?
    API_KEY = "c945744d9d15f2e14ff811ff3900a645"

    # Add initialize to get address
    # Add method to create proper string for API
    address = "5032 Nine Mile Creek Parkway, Bloomington MN"

    # Add method to get back API response, parse to JSON and return
    url = "http://api.positionstack.com/v1/forward?access_key=#{API_KEY}&query=#{address}"

    response = HTTParty.get(url)

    response_json = JSON.parse(response.body)
    
    puts response_json["data"]

    # Move link portion to Forecast Scraper class
    puts "https://forecast.weather.gov/MapClick.php?lat=#{geo_latitude}&lon=#{geo_longitude}&unit=0&lg=english&FcstType=digital"

    # Add method to create this hash from the response - iterate if more than 1 set of return values or always use first?
    geo_data = {
        :latitude => response_json["data"][0]["latitude"],
        :longitude => response_json["data"][0]["longitude"],
        :city => response_json["data"][0]["locality"],
        :state => response_json["data"][0]["region_code"]
    }

    puts geo_data

end