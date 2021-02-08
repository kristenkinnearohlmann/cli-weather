class Weather

    attr_reader :weather_summary

    def initialize
        @weather_summary = {}
    end

    def get_weather(display_weather)

        @weather_summary = Scraper.nws(self.weather_summary, display_weather.geo_data)
        print_weather if @weather_summary
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

    # def weather_main
    #     binding.pry
    #     while !quit?
    #         # quit? false at start of loop
    #         # get_address can result in quit? true
    #         # get_address can result in No Choice
    #         # geolocation can return @geo_location.geo_data.empty? should be quit? true
    #         # geolocation can return No Choice - how to retry
            
    #         # DETAIL more scenarios to determine proper conditional

    #         get_address
    #         binding.pry
    #         geo = Geolocation.new()
    #         binding.pry
    #     #     if !quit?
    #     #         if quit?
    #     #             puts "Have a nice day!"
    #     #         if (@geo_location.geo_data.empty? && !quit?) then
    #     #             @geo_location = Geolocation.new(address_type,address)
    #     #         end
    #     #         @weather_summary = Scraper.nws(@geo_location)
    #     #         print_weather if @weather_summary
    #     #         print "\nGet another forecast? Enter Y or N: "
    #     #         response = gets.chomp.downcase
    #     #         @quit = true if response == 'n'
    #     #     end
    #     # end
    #         @quit = true
    #     end
    #     puts "Enjoy your weather!"
    # end

end