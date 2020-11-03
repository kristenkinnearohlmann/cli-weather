class Weather

    attr_accessor :address, :address_type, :lat_lon
    attr_reader :quit

    def initialize
        puts "Let's get the weather!"
        @quit = false
        get_weather
    end

    def get_weather
        get_address
        while !@quit           
            @lat_lon = Geolocation.new(address_type,address)
            @quit = true
        end
        puts "End of #get_weather"
    end

    def get_address
        response = 'n'

        while (@address_type != 0 && response == 'n')
            print "Choose location type to enter:\n\t[1] Zip code only\n\t[2] City, State\n\t[3] Full Address\n\t[0] Quit\nEnter your choice: "
            @address_type = gets.chomp.to_i

            if address_type == 0 then # quit
                puts "Have a great day!"
                @quit = true
                break
            elsif @address_type == 1 then # zipcode only
                print "Enter zipcode: "
                @address = gets.chomp
            elsif @address_type == 2 then # city & state
                print "Enter city, state: "
                @address = gets.chomp
            elsif @address_type == 3 then # full address
                print "Enter full address (street, city, state, zipcode): "
                @address = gets.chomp
            end

            print "You entered #{@address}, is this correct? Enter Y or N: "
            response = gets.chomp.downcase

            if response == 'y' then
                puts "Let's get some weather!"
            end
        end
    end

end