class Geolocation

    attr_accessor :address, :city, :state, :zipcode
    attr_reader :address_full, :lat_lon, :geo_data

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
            # format: "5032 Nine Mile Creek Parkway, Bloomington MN"
            puts "#{msg} #{address} by full address"
        end

        get_location_information
    end

    def get_location_information
        url = "http://api.positionstack.com/v1/forward?access_key=#{API_KEY}&query=#{@address}"
        puts url
        geo_data_raw = get_api_data(url)
        process_geo_data(geo_data_raw)
    end

    def get_api_data(url)
        response = HTTParty.get(url)
        response_json = JSON.parse(response.body)
        response_json["data"]
    end

    def process_geo_data(geo_data_raw)
        puts geo_data_raw.length
        geo_data_raw.each do |item|
            puts item.instance_of? Hash
        end

        
        # geo_data_raw.each do |key,value|
        #     puts "#{key} is #{value}"
        # end
            # # Add method to create this hash from the response - iterate if more than 1 set of return values or always use first?
    # geo_data = {
    #     :latitude => response_json["data"][0]["latitude"],
    #     :longitude => response_json["data"][0]["longitude"],
    #     :city => response_json["data"][0]["locality"],
    #     :state => response_json["data"][0]["region_code"]
    # }

    # puts geo_data
    end



end