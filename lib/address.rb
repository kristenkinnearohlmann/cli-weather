class Address

    attr_reader :address_type, :address_type_range, :address_values, :valid
    
    def initialize
        @address_type = nil
        @address_values = []
    end

    def return_address(display_weather)

        while (display_weather.quit == false && @address_values.empty?)

            get_address_type
            if @address_type == 4 # User selected quit
                puts "\nHave a great day!"
                display_weather.quit = true
            else
                request_address_input

                if !valid_address?(display_weather)
                    puts "\nThis address does not return results. Please enter a new address."
                    @address_values = []
                end
            end
        end
    end

    def get_address_type
        @address_type_range = (1..4)
        loop do
            print "\nChoose location type to enter:\n\t[1] Zip code only\n\t[2] City and State\n\t[3] Full Address\n\t[4] Quit\nEnter your choice: "
            @address_type = gets.chomp.to_i
            break if valid_address_type?
        end
    end

    def valid_address?(display_weather)
        display_weather.geolocation.get_location_information(@address_values).empty? ? false : true
    end

    def valid_address_type?
        # if (@address_type == 1 || @address_type == 2 || @address_type == 3 || @address_type == 4)
        if @address_type_range.include?(@address_type)
            true
        else
            puts "#{address_type} is not a valid option. Please make a valid selection."
            false
        end
    end

    def request_address_input

        if @address_type == 1 then # zipcode only
            get_zipcode
        elsif @address_type == 2 then # city & state
            get_city
            get_state
        elsif @address_type == 3 then # full address
            get_address
            get_city
            get_state
            get_zipcode
        end

        @address_values = @address_values.join(",")

    end

    def get_address
        valid = false

        while !valid
            print "Enter street address: "
            input = gets.chomp
            @address_values.push(input)
            valid = true
        end

    end

    def get_city
        valid = false

        while !valid
            print "Enter city: "
            input = gets.chomp
            @address_values.push(input)
            valid = true
        end

    end

    def get_state

        valid = false

        state_abbrevs = ['AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL','IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','PR','RI','SC','SD','TN','TX','UT','VT','VA','WA','WV','WI','WY']

        while !valid
            print "Enter state abbreviation (ex. AL): "
            input = gets.chomp

            if input.length < 2 || input.length > 2 # entry longer than 2 characters
                puts "You have not entered 2 characters. Please enter a 2 character state abbreviation."
            elsif !state_abbrevs.include? input
                puts "This is not a valid state abbreviation. Please enter a valid state abbreviation."
            else
                @address_values.push(input)
                valid = true
            end
        end

    end

    def get_zipcode

        valid = false

        while !valid
            print "Enter zipcode: "
            input = gets.chomp

            if /\A\d{5}\z/.match(input) == nil # malformed zipcode
                puts "This is not a valid zipcode. Please enter a valid zip code." 
            else
                @address_values.push(input)
                valid = true
            end
        end

    end

end