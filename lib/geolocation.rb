class Geolocation

    attr_accessor :address, :city, :state, :zipcode
    attr_reader :address_full, :lat_lon

    # How can this be hidden from GitHub?
    API_KEY = "c945744d9d15f2e14ff811ff3900a645"

    def initialize(address_type, address)
        @address_type = address_type
        @address = address

        msg = "Finding weather for"

        if @address_type == 1 then # zipcode only
            puts "#{msg} #{address} by zipcode"
        elsif @address_type == 2 then # city & state
            @address.sub!(",","")            
            puts "#{msg} #{address} by city and state"
        elsif @address_type ==3 then # full address
            puts "#{msg} #{address} by full address"
        end

        url = "http://api.positionstack.com/v1/forward?access_key=#{API_KEY}&query=#{@address}"
        puts url
    end



    # # Add initialize to get address
    # # Add method to create proper string for API
    # address = "5032 Nine Mile Creek Parkway, Bloomington MN"

    # # Add method to get back API response, parse to JSON and return
    # url = "http://api.positionstack.com/v1/forward?access_key=#{API_KEY}&query=#{address}"

    # response = HTTParty.get(url)

    # response_json = JSON.parse(response.body)
    
    # puts response_json["data"]

    # # Move link portion to Forecast Scraper class
    # puts "https://forecast.weather.gov/MapClick.php?lat=#{response_json["data"][0]["latitude"]}&lon=#{response_json["data"][0]["longitude"]}&unit=0&lg=english&FcstType=digital"

    # # Add method to create this hash from the response - iterate if more than 1 set of return values or always use first?
    # geo_data = {
    #     :latitude => response_json["data"][0]["latitude"],
    #     :longitude => response_json["data"][0]["longitude"],
    #     :city => response_json["data"][0]["locality"],
    #     :state => response_json["data"][0]["region_code"]
    # }

    # puts geo_data

end