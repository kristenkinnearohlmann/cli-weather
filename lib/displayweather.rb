class DisplayWeather

    attr_reader :weather, :address, :retry, :quit

    def initialize
        @weather = Weather.new
        @address = Address.new
        @retry = false
        @quit = false
    end

    def self.run
        puts "\nLet's get the weather!"

        display_weather  = self.new
        # @weather = Weather.new
        # @address = Address.new

        binding.pry
        display_weather.address.return_address(display_weather)
        binding.pry
    end

    def set_address

        response = 'n'
binding.pry
        while (@address_type != 4 && response == 'n')
            

            if @address_type == 1 then # zipcode only
                print "\nEnter zipcode: "
                @address = gets.chomp
                if /\A\d{5}\z/.match(@address) == nil
                    puts "This is not a valid zipcode. Please enter a valid zip code." 
                    response = 'n'
                    next
                end
            elsif @address_type == 2 then # city & state
                print "\nEnter city, state: "
                @address = gets.chomp
            elsif @address_type == 3 then # full address
                print "\nEnter full address (street, city, state, zipcode): "
                @address = gets.chomp
            elsif @address_type == 4 then # quit
                puts "\nHave a great day!"
                @quit = true
                break    
            else
                puts "Not a valid option, please make a selection from the menu."
                response = 'n'
                next
            end

            print "You entered #{@address}, is this correct? Enter Y or N: "
            response = gets.chomp.downcase

            if response == 'y' then
                puts "\nLet's get some weather!"
            end
        end
    end
    
end