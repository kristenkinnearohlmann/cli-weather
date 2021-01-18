class Address

    attr_reader :address_type, :address, :response
    
    def initialize
        @address_type = -1
        @response = 'n'
    end

    def return_address(display_weather)
        get_address_type

        if (@address_type == 4)
            puts "\nHave a great day!"
            display_weather.weather.quit = true
        elsif (@address_type < 1 || @address_type > 3)
            # TODO: figure out proper looping for this
            puts "#{address_type} is not a valid option. Please make a valid selection."
            get_address_type
        else
            while !verified_address?
                request_address_input
            end
            display_weather.weather.quit = true
            binding.pry
        end
    end

    def get_address_type
        print "\nChoose location type to enter:\n\t[1] Zip code only\n\t[2] City, State\n\t[3] Full Address\n\t[4] Quit\nEnter your choice: "
        @address_type = gets.chomp.to_i
    end

    def request_address_input
        if @address_type == 1 then # zipcode only
            print "\nEnter zipcode: "
        elsif @address_type == 2 then # city & state
            print "\nEnter city, state: "
        elsif @address_type == 3 then # full address
            print "\nEnter full address (street, city, state, zipcode): "
        end

        @address = gets.chomp
    end

    def verified_address?
        return false if @address == nil

        if @address_type == 1 then # zipcode only
            if /\A\d{5}\z/.match(@address) == nil
                puts "This is not a valid zipcode. Please enter a valid zip code." 
                return false
            else
                return true
            end
        else
            return true
        end
    end

end