class Scraper
    # Nokogiri
    # Open URL

    attr_reader :url, :url_data, :weather_summary

    def self.nws(geo_location)
        @weather_summary = {}
        lat_val = geo_location.geo_data[:latitude]
        lon_val = geo_location.geo_data[:longitude]

        # @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}&unit=0&lg=english&FcstType=digital" # data table did not really have enough to parse easily, return to this in the future
        @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}"

        self.get_data_nws
        @weather_summary
    end

    def self.get_data_nws
        @url_data = Nokogiri::HTML(open(@url).read,nil,'utf-8')

        # URL, source of forecast, weather station location
        @weather_summary = {
            :url => @url,            
            :source => @url_data.css("#header-nws").children[0].attributes["alt"].value, 
            :wx_rpt_location => {:loc_title => @url_data.css("#current-conditions").css(".panel-title").text.strip} # weather location station
        }
        #   Lat, Lon, Elev
        label = ""
        @url_data.css("#current-conditions").css(".smallTxt").children.each_with_index do |child,index|
            label = child.text.strip.sub!("\u00A0","").sub!(":","").downcase if index.even?
            @weather_summary[:wx_rpt_location][label.to_sym] = child.text.strip if index.odd?
        end

        # Current conditions - summary
        @weather_summary[:current_conditions] = {}
        @url_data.css("#current_conditions-summary").css("p").each_with_index do |item,index|
            @weather_summary[:current_conditions][:summary] = item.text.strip if index == 0
            @weather_summary[:current_conditions][:temp_farenheit] = item.text.strip if index == 1
            @weather_summary[:current_conditions][:temp_celsius] = item.text.strip if index == 2
        end

        # Current conditions - details
        @url_data.css("#current-conditions").css("#current_conditions_detail").css("td").children.each_with_index do |child,index|
            label = child.text.strip.downcase.gsub(" ","_") if index.even?
            @weather_summary[:current_conditions][label.to_sym] = child.text.strip if index.odd?
        end

        #  Detailed Forecast
        label = @url_data.css("#detailed-forecast").css(".panel-title").text.strip.downcase.gsub(" ","_")
        @weather_summary[label.to_sym] = {}
        @url_data.css("#detailed-forecast-body").css(".row").each do |item|
            @weather_summary[label.to_sym][item.css(".forecast-label").text.strip.downcase.gsub(" ","_").to_sym] = item.css(".forecast-text").text.strip
        end

    end

end