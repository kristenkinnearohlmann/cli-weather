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
        @response = "N"

        while @response == "N"
            puts "Choose location type to enter - 1. Zip code only or 2. City, State, Zip code"
            addr_type_sel = gets.chomp.to_i

            if addr_type_sel == 1 then
                puts "Enter zipcode: "
                @address = gets.chomp
            elsif addr_type_sel == 1 then
                puts "Enter address in the format city, state zipcode: "
                @address = gets.chomp
            end

            puts "You entered #{@address}, is this correct? Enter Y or N"
            @response = gets.chomp

            if @response == 'Y' then
                puts "Let's get some weather!"
            end
        end
    end

end