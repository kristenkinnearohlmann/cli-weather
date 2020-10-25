class Weather

    attr_accessor :address, :address_type, :response, :lat_lon

    def initialize
        puts "Let's get the weather!"
        get_weather
    end

    def get_weather
        get_address
        @lat_lon = Geolocation.new(address_type,address)
        puts "End of #get_weather"
    end

    def get_address
        @response = "N"

        while @response == "N"
            puts "Choose location type to enter - 1. Zip code only, 2. City, State, 3. Full Address"
            @address_type = gets.chomp.to_i

            if @address_type == 1 then
                puts "Enter zipcode: "
                @address = gets.chomp
            elsif @address_type == 2 then
                puts "Enter city, state: "
                @address = gets.chomp
            elsif @address_type == 3 then
                puts "Enter full address (street, city, state, zipcode): "
            end

            puts "You entered #{@address}, is this correct? Enter Y or N"
            @response = gets.chomp

            if @response == 'Y' then
                puts "Let's get some weather!"
            end
        end
    end

end