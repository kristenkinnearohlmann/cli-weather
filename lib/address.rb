class Address

    attr_reader :address_type, :address, :response
    
    def initialize
        @address_type = -1
        @response = 'n'
    end

    def return_address
        binding.pry
        while (@address_type != 4 && @response == 'n')
            get_address_type
            if (@address_type == 4)
                puts "\nHave a great day!"
            end
            request_address_input
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

end