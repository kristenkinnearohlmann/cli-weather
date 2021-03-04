class Geolocation

    attr_reader :lat_lon, :geo_data_raw, :loc_index, :geo_data

    # How can this be hidden from GitHub?
    API_KEY = "c945744d9d15f2e14ff811ff3900a645"

    def initialize()
        @geo_data = {}
    end

    def select_geolocation(display_weather)

        handle_location(display_weather)
        get_geo_data if !display_weather.quit

    end

    def get_location_information(address_values)

        url = "http://api.positionstack.com/v1/forward?access_key=#{API_KEY}&query=#{address_values}"
        @geo_data_raw = get_api_data(url)

    end    

    def get_api_data(url)

        response = HTTParty.get(url)
        @geo_data_raw = JSON.parse(response.body)
        @geo_data_raw["data"]
        # TODO: Make separate data objects for these instead of iterating hash

    end

    def handle_location(display_weather)

        # geo_data_raw is an array of 0 or more hash elements
        if @geo_data_raw.length > 1 then
            puts "\nFound #{@geo_data_raw.length} results. Please choose which location to use: "
            @loc_index = choose_location
        else
            @loc_index = 0
        end

        if @loc_index == nil
            puts "No choice selected. The program will exit."
            display_weather.quit = true
        else
            puts "Processing weather for #{@geo_data_raw[@loc_index]["label"]}"
        end

    end

    def choose_location

        @geo_data_raw.each_index do |index|
            item_nbr = index + 1
            puts "\t[#{item_nbr}] #{@geo_data_raw[index]["label"]}"
        end

        no_choice = @geo_data_raw.count+1
        puts "\t[#{no_choice}] None of these choices"

        print "Location choice: "
        choice_nbr = (gets.chomp.to_i)

        if choice_nbr == no_choice
            choice_nbr = nil
        else
            choice_nbr -= 1
        end

        choice_nbr
    end

    def get_geo_data

        geo_hash = @geo_data_raw[@loc_index]

        geo_hash.each do |key,value|
            @geo_data[key.to_sym] = value
        end

    end

end