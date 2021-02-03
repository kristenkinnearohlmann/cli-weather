class Geolocation

    attr_reader :lat_lon, :geo_data_raw, :loc_index, :geo_data

    # How can this be hidden from GitHub?
    API_KEY = "c945744d9d15f2e14ff811ff3900a645"

    def initialize()
        @geo_data = {}
    end

    def select_geolocation
        binding.pry
        handle_location
        get_geo_data
    end

    # def select_geolocation(display_weather)
    #     binding.pry
    #     # address_type = display_weather.address_type
    #     # address_values = display_weather.address_values.join(", ")


    #     # puts "Finding weather for #{address_values}."

    #     # while !display_weather.retry
    #     #     get_location_information(address_values)
    #     #     handle_location
    #     #     binding.pry
    #     # end
    # end

    # def get_location_information(address_values)
    #     url = "http://api.positionstack.com/v1/forward?access_key=#{API_KEY}&query=#{address_values}"
    #     @geo_data_raw = get_api_data(url)
    #     @loc_index = select_location

    #     if (@loc_index >= 0) then
    #         get_geo_data
    #     end
    # end

    def get_location_information(address_values)

        url = "http://api.positionstack.com/v1/forward?access_key=#{API_KEY}&query=#{address_values}"
        @geo_data_raw = get_api_data(url)

    end    


    def get_api_data(url)

        response = HTTParty.get(url)
        @geo_data_raw = JSON.parse(response.body)
        @geo_data_raw["data"]

    end

    def handle_location
        binding.pry

        # # geo_data_raw is an array of 0 or more hash elements
        # index_nbr = -1

        # binding.pry
        # if @geo_data_raw.length == 0 then
        #     puts "No results found" # index_nbr is already set to -1
        # elsif @geo_data_raw.length == 1 then
        #     puts "Found one result - processing your weather now..."
        #     index_nbr = 0 # single result, array element 0
        # elsif @geo_data_raw.length > 1 then
        #     puts "Found #{@geo_data_raw.length} results. Please choose which location to use: "
        #     index_nbr = choose_location
        #     if index_nbr == -2 then # select the option for None
        #         puts "You selected none of these choices"
        #     else
        #         puts "Processing weather for #{@geo_data_raw[index_nbr]["label"]}"
        #     end
            
        # end
        # index_nbr  
    end

    def choose_location
        @geo_data_raw.each_index do |index|
            puts "\t[#{index+1}] #{@geo_data_raw[index]["label"]}"
        end
        puts "\t[#{@geo_data_raw.count+1}] None of these choices"

        print "Location choice: "
        choice_nbr = (gets.chomp.to_i) - 1

        choice_nbr = -2 if choice_nbr == @geo_data_raw.count # set to -2 if None selection is made
        choice_nbr
    end

    def get_geo_data
        binding.pry
        geo_hash = @geo_data_raw[@loc_index]

        geo_hash.each do |key,value|
            @geo_data[key.to_sym] = value
        end

    end

end