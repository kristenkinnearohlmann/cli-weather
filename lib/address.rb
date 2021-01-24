class Address

    attr_reader :address_type, :address
    
    def initialize
        @address_type = nil
    end

    def return_address(display_weather)
        if (display_weather.quit == false || display_weather.retry == true)
            get_address_type
            if @address_type == 4 # User selected quit
                puts "\nHave a great day!"
                display_weather.quit = true
            else
                request_address_input
                display_weather.quit = true
            end
        end
    end

    def get_address_type
        loop do
            print "\nChoose location type to enter:\n\t[1] Zip code only\n\t[2] City and State\n\t[3] Full Address\n\t[4] Quit\nEnter your choice: "
            @address_type = gets.chomp.to_i
            break if valid_address_type?
        end
    end

    def valid_address_type?
        if (@address_type == 1 || @address_type == 2 || @address_type == 3 || @address_type == 4)
            true
        else
            puts "#{address_type} is not a valid option. Please make a valid selection."
            false
        end
    end

    def request_address_input
        loop do 
            if @address_type == 1 then # zipcode only
                @address = get_zipcode
            elsif @address_type == 2 then # city & state
                @address = get_city
                @address = @address + " " + get_state
                binding.pry
            elsif @address_type == 3 then # full address
                print "\nEnter full address (STREET,CITY,STATE ABBREV,ZIPCODE): "
            end

            # @address = gets.chomp
            break if verified_address?
        end
    end

    def get_zipcode
        print "Enter zipcode: "
        gets.chomp
    end

    def get_city
        print "Enter city: "
        gets.chomp
    end

    def get_state
        print "Enter state abbreviation (ex. AL): "
        gets.chomp
    end

    def verified_address?

        if (@address_type == 1 && /\A\d{5}\z/.match(@address) == nil) # malformed zipcode
            puts "This is not a valid zipcode. Please enter a valid zip code." 
            false
        elsif (@address_type == 2 || @address_type == 3)
            chk_val = address.split(" ")
            chk_val.collect! { |e| e ? e.strip : e }
            binding.pry
            true
        else
            true
        end
    end

end