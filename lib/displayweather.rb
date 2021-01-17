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

        display_weather.address.return_address(display_weather)
        binding.pry
    end

    def set_address


            print "You entered #{@address}, is this correct? Enter Y or N: "
            response = gets.chomp.downcase

            if response == 'y' then
                puts "\nLet's get some weather!"
            end
        end
    end
    
end