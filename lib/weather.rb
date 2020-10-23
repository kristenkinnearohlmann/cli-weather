class Weather

    attr_accessor :address, :response

    def initialize
        puts "Let's get the weather!"
        get_weather
    end

    def get_weather
        get_address
        puts "End of #get_weather"
    end

    def get_address
        puts "Enter a location (zipcode or city, state zipcode) to find some weather: "
        @address = gets.chomp
        puts "You entered #{@address}, is this correct? Enter Y or N"
        @response = gets.chomp
    end

end