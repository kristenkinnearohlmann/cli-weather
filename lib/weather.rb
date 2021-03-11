class Weather

    attr_reader :weather_summary, :current_conditions, :detailed_forecast

    def initialize
        @weather_summary = {}
        #TODO: Separate out attributes, like current conditions and detailed conditions
    end

    def get_weather(display_weather)

        @weather_summary = Scraper.new.nws(self.weather_summary, display_weather.geo_data)
    
        if @weather_summary.empty?
            puts "No weather returned."
        else
            print_weather if @weather_summary
        end
        
    end

    def set_current_conditions
        
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