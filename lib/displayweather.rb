class DisplayWeather

    attr_reader :weather

    def self.run
        puts "\nLet's get the weather!"

        @weather = Weather.new
        binding.pry
        @weather.set_retry
        binding.pry
    end
    
end