class Weather

    attr_accessor :address, :address_type, :geo_location
    attr_reader :quit

    def initialize
        puts "\nLet's get the weather!"
        @quit = false
        weather_main
    end

    def weather_main
        get_address
        while !@quit           
            @geo_location = Geolocation.new(address_type,address) if !quit?
            @quit = true
        end
        puts "End of #weather_main"
    end

    def get_address
        response = 'n'

        while (@address_type != 0 && response == 'n')
            print "\nChoose location type to enter:\n\t[1] Zip code only\n\t[2] City, State\n\t[3] Full Address\n\t[0] Quit\nEnter your choice: "
            @address_type = gets.chomp.to_i

            if address_type == 0 then # quit
                puts "\nHave a great day!"
                @quit = true
                break
            elsif @address_type == 1 then # zipcode only
                print "\nEnter zipcode: "
                @address = gets.chomp
            elsif @address_type == 2 then # city & state
                print "\nEnter city, state: "
                @address = gets.chomp
            elsif @address_type == 3 then # full address
                print "\nEnter full address (street, city, state, zipcode): "
                @address = gets.chomp
            end

            print "You entered #{@address}, is this correct? Enter Y or N: "
            response = gets.chomp.downcase

            if response == 'y' then
                puts "\nLet's get some weather!"
            end
        end
    end

    def quit?
        return @quit
    end

end