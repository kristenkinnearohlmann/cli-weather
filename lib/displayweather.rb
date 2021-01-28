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
        binding.pry
        address.return_address(self)
        binding.pry
        geolocation.select_geolocation(self)
    end

    def address_type
        self.address.address_type
    end

    def address_type=(value)
        binding.pry
        self.address.address_type = value
    end

end