class DisplayWeather

    attr_accessor :weather, :address, :retry, :quit

    def initialize
        @weather = Weather.new
        @address = Address.new
        @retry = false
        @quit = false
    end

    def run
        puts "\nLet's get the weather!"

        binding.pry
        # display_weather.address.return_address(display_weather)
    end

    # def set_address


    #         print "You entered #{@address}, is this correct? Enter Y or N: "
    #         response = gets.chomp.downcase

    #         if response == 'y' then
    #             puts "\nLet's get some weather!"
    #         end
    #     end
    # end
    
end