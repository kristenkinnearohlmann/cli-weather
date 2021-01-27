class DisplayWeather

    attr_accessor :weather, :address, :geolocation, :retry, :quit

    def initialize
        @weather = Weather.new
        @address = Address.new
        @geolocation = Geolocation.new
        @retry = false
        @quit = false
    end

    def run
        puts "\nLet's get the weather!"

        address.return_address(self)
        binding.pry
        geolocation.select_geolocation(self)
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