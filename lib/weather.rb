class Weather

    attr_accessor :address, :address_type, :geo_location, :weather_summary
    attr_reader :quit

    def initialize
        puts "\nLet's get the weather!"
        @quit = false
        weather_main
    end

    def weather_main
        get_address
        while !@quit           
            @geo_location = Geolocation.new(address_type,address) if !quit?
            @weather_summary = Scraper.nws(@geo_location)
            print_weather if @weather_summary
            @quit = true
        end
        puts "End of #weather_main"
    end

    def get_address
        response = 'n'

        while (@address_type != 0 && response == 'n')
            print "\nChoose location type to enter:\n\t[1] Zip code only\n\t[2] City, State\n\t[3] Full Address\n\t[0] Quit\nEnter your choice: "
            @address_type = gets.chomp.to_i

            if address_type == 0 then # quit
                puts "\nHave a great day!"
                @quit = true
                break
            elsif @address_type == 1 then # zipcode only
                print "\nEnter zipcode: "
                @address = gets.chomp
            elsif @address_type == 2 then # city & state
                print "\nEnter city, state: "
                @address = gets.chomp
            elsif @address_type == 3 then # full address
                print "\nEnter full address (street, city, state, zipcode): "
                @address = gets.chomp
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
                puts "#{item.capitalize()}: #{val}"
            end
        end

        puts "\nDetailed Forecast:"
        @weather_summary[:detailed_forecast].each {|item, val| puts "#{item.to_s.gsub("_"," ").capitalize()}: #{val}"}
    end

end