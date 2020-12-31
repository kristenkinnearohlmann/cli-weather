class Weather

    attr_accessor :address, :address_type, :geo_location, :weather_summary; :retry
    attr_reader :quit

    ## refactor - call from another file to a Start method then perform self.new?
    def initialize
        puts "\nLet's get the weather!"
        @quit = false
        weather_main
    end

    def weather_main
        while !quit?
            # quit? false at start of loop
            # get_address can result in quit? true
            # get_address can result in No Choice
            # geolocation can return @geo_location.geo_data.empty? should be quit? true
            # geolocation can return No Choice - how to retry
            
            # DETAIL more scenarios to determine proper conditional


            get_address
            Geolocation.new(address_type,address)
        #     if !quit?
        #         if quit?
        #             puts "Have a nice day!"
        #         if (@geo_location.geo_data.empty? && !quit?) then
        #             @geo_location = Geolocation.new(address_type,address)
        #         end
        #         @weather_summary = Scraper.nws(@geo_location)
        #         print_weather if @weather_summary
        #         print "\nGet another forecast? Enter Y or N: "
        #         response = gets.chomp.downcase
        #         @quit = true if response == 'n'
        #     end
        # end
            @quit = true
        end
        puts "Enjoy your weather!"
    end

    def get_address
        response = 'n'

        while (@address_type != 4 && response == 'n')
            print "\nChoose location type to enter:\n\t[1] Zip code only\n\t[2] City, State\n\t[3] Full Address\n\t[4] Quit\nEnter your choice: "
            @address_type = gets.chomp.to_i

            if @address_type == 1 then # zipcode only
                print "\nEnter zipcode: "
                @address = gets.chomp
                if /\A\d{5}\z/.match(@address) == nil
                    puts "This is not a valid zipcode. Please enter a valid zip code." 
                    response = 'n'
                    next
                end
            elsif @address_type == 2 then # city & state
                print "\nEnter city, state: "
                @address = gets.chomp
            elsif @address_type == 3 then # full address
                print "\nEnter full address (street, city, state, zipcode): "
                @address = gets.chomp
            elsif @address_type == 4 then # quit
                puts "\nHave a great day!"
                @quit = true
                break    
            else
                puts "Not a valid option, please make a selection from the menu."
                response = 'n'
                next
            end

            print "You entered #{@address}, is this correct? Enter Y or N: "
            response = gets.chomp.downcase

            if response == 'y' then
                puts "\nLet's get some weather!"
            end
        end
    end

    def quit?
        return @quit
    end

    def print_weather
        puts "\nWeather from #{@weather_summary[:source]} (#{@weather_summary[:url]})."
        puts "#{@weather_summary[:wx_rpt_location][:loc_title]} (Lat: #{@weather_summary[:wx_rpt_location][:lat]} Lon: #{@weather_summary[:wx_rpt_location][:lon]} Elev: #{@weather_summary[:wx_rpt_location][:elev]})"

        puts "\nCurrent Conditions:"
        puts "#{@weather_summary[:current_conditions][:summary]} (#{@weather_summary[:current_conditions][:temp_farenheit]}|#{@weather_summary[:current_conditions][:temp_celsius]})"
        @weather_summary[:current_conditions].each do |item,val|
            if ((item != :summary) && (item != :temp_farenheit) && (item != :temp_celsius))
                puts "#{item.to_s.gsub("_"," ").capitalize()}: #{val}"
            end
        end

        puts"\nPress Enter for Detailed Forecast: "
        enter_key = gets.chomp

        puts "\nDetailed Forecast:"
        @weather_summary[:detailed_forecast].each {|item, val| puts "#{item.to_s.gsub("_"," ").capitalize()}: #{val}"}
    end

end