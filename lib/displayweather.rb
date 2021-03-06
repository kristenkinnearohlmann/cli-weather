class DisplayWeather

    attr_accessor :weather, :address, :geolocation, :retry, :quit

    def initialize
        set_attributes
    end

    def set_attributes
        @weather = Weather.new
        @address = Address.new
        @geolocation = Geolocation.new
        @retry = false
        @quit = false
    end

    def run

        puts "\nLet's get the weather!"

        while !@quit
            address.return_address(self)
            geolocation.select_geolocation(self) if !@quit
            weather.get_weather(self) if !@quit

            if !@quit
                print "\nGet another forecast? Enter Y or N: "
                response = gets.chomp.downcase
                # @quit = true if response == 'n'
                if response == 'n'
                    @quit = true
                    puts "\nHave a great day!"
                else
                    set_attributes
                end
            end
        end

    end

    def address_type
        self.address.address_type
    end

    def address_values
        self.address.address_values
    end

    def geo_data
        self.geolocation.geo_data
    end

    # def weather_summary=(weather_summary)
    #     @weather.weather_summary = weather_summary
    # end

end