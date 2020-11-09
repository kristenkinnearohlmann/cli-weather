class Geolocation

    attr_accessor :address, :city, :state, :zipcode
    attr_reader :address_full, :lat_lon, :geo_data_raw, :loc_index, :geo_data

    # How can this be hidden from GitHub?
    API_KEY = "c945744d9d15f2e14ff811ff3900a645"

    def initialize(address_type, address)
        @address_type = address_type
        @address = address

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
    end

    def get_api_data(url)
        response = HTTParty.get(url)
        response_json = JSON.parse(response.body)
        response_json["data"]
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
            puts "Processing weather for #{@geo_data_raw[index_nbr]["label"]}"
            index_nbr
        end

        def get_geo_data
            # geo_data_raw.each_index do |index|
            #     puts "\t[#{index+1}] #{geo_data_raw[index]["label"]}"
            # end
            # geo_data_raw.each do |item|
            #     # puts item.instance_of? Hash
            #     item.each do |key,value|
            #         puts "#{key}: #{value}"
            #     end
            #     puts "\n"
            # end            
            # # Add method to create this hash from the response - iterate if more than 1 set of return values or always use first?
    # geo_data = {
    #     :latitude => response_json["data"][0]["latitude"],
    #     :longitude => response_json["data"][0]["longitude"],
    #     :city => response_json["data"][0]["locality"],
    #     :state => response_json["data"][0]["region_code"]
    # }
        end

    end

    def choose_location
        @geo_data_raw.each_index do |index|
            puts "\t[#{index+1}] #{@geo_data_raw[index]["label"]}"
        end
        print "Location choice: "
        choice_nbr = (gets.chomp.to_i) - 1
    end

end