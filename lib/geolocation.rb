class Geolocation

    attr_accessor :address, :city, :state, :zipcode
    attr_reader :address_full, :lat_lon, :geo_data_raw, :loc_index, :geo_data

    # How can this be hidden from GitHub?
    API_KEY = "c945744d9d15f2e14ff811ff3900a645"

    def initialize(address_type, address)
        @address_type = address_type
        @address = address
        @geo_data = {}

        select_geolocation
    end

    def select_geolocation
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
        @geo_data_raw = get_api_data(url)
        @loc_index = select_location

        if @loc_index == -1 then # no results found
            puts "Invalid entry"
        else
            get_geo_data
        end
    end

    def get_api_data(url)
        response = HTTParty.get(url)
        @geo_data_raw = JSON.parse(response.body)
        @geo_data_raw["data"]
    end

    def select_location
        # geo_data_raw is an array of 0 or more hash elements
        index_nbr = -1

        if @geo_data_raw.length == 0 then
            puts "No results found"
        elsif @geo_data_raw.length == 1 then
            puts "Found one result - processing your weather now..."
            index_nbr = 0
        elsif @geo_data_raw.length > 1 then
            puts "Found #{@geo_data_raw.length} results. Please choose which location to use: "
            index_nbr = choose_location
            puts "Processing weather for #{@geo_data_raw[index_nbr]["label"]}" if index_nbr >= 0
        end
        index_nbr  
    end

    def choose_location
        @geo_data_raw.each_index do |index|
            puts "\t[#{index+1}] #{@geo_data_raw[index]["label"]}"
        end
        puts "\t[0] None of these choices"
        print "Location choice: "
        choice_nbr = (gets.chomp.to_i) - 1
    end

    def get_geo_data

        geo_hash = @geo_data_raw[@loc_index]

        geo_hash.each do |key,value|
            @geo_data[key.to_sym] = value
        end

    end

end