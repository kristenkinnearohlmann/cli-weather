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
        geolocation.select_geolocation if !@quit
        binding.pry
    end

    def address_type
        self.address.address_type
    end

    def address_values
        self.address.address_values
    end

    # def address_type=(address_type)
    #     binding.pry
    #     @address.address_type = address_type
    # end

end