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
    end

    def self.get_data_nws
        puts @url
        @url_data = Nokogiri::HTML(open(@url).read,nil,'utf-8')

        # URL, source of forecast, weather station location
        @weather_summary = {
            :url => @url,            
            :source => @url_data.css("#header-nws").children[0].attributes["alt"].value, 
            :wx_rpt_location => {:loc_title => @url_data.css("#current-conditions").css(".panel-title").text.strip} # weather location station
        }
        #   Lat, Lon, Elev:
        ph = {}
        # puts @url_data.css("#current-conditions").css(".smallTxt").children[0].text.strip.sub!("\u00A0","")
        label = @url_data.css("#current-conditions").css(".smallTxt").children[0].text.strip.sub!("\u00A0","").sub!(":","")
        ph[label.to_sym] = 1
        puts ph

        binding.pry
        # Current conditions (in progress): 
        #       can get length with @url_data.css("#current-conditions").css(".smallTxt").children => how to prepare outside loop?
        #       @url_data.css("#current-conditions").css(".smallTxt").children.each_with_index do |child,index|
        #           print "#{child.text}" if index.even?
        #           print "#{child.text}\t" if index.odd?
        #       end
        #   Summary: 
        #           conditions = @url_data.css("#current_conditions-summary").css("p")
        #           conditions.each {|item| puts item.text}
        #   Details: 
        #       condition_details = @url_data.css("#current-conditions").css("#current_conditions_detail").css("td").children
        #       condition_arr = []
        #       condition_details.each do |item|
        #           condition_arr << item.text.strip
        #       end
        #       need to use puts to display the value correctly
        #       this works but how to iterate?? puts "#{condition_details[6].text}: #{condition_details[7].text}"
        #       condition_arr.each_with_index do |val,index|
        #           print "#{val}: " if index % 2 == 0
        #           puts "#{val}" if index % 2 == 1
        #       end
        # Detailed Forecast (in progress): 
        #   Title: @url_data.css("#detailed-forecast").css(".panel-title").text.strip
        #   Detail:
        #       @url_data.css("#detailed-forecast-body").css(".row").each do |item|
        #           print "#{item.css(".forecast-label").text.strip}: "
        #           puts item.css(".forecast-text").text.strip
        #       end
        #  Another details from tombstones:
        #       @url_data.css("#seven-day-forecast-list").css(".forecast-tombstone").each do |stone|
        #           @url_data.css("#seven-day-forecast-list").css(".forecast-tombstone").css(".period-name").each do |name|
        #           period_name = ""
        #               name.children.each do |item|
        #                   piece = item.text.strip
        #                   period_name += "#{piece} " if piece.length > 0
        #               end
        #               puts period_name.strip
        #           end
        #           puts stone.css(".short-desc").text
        #           puts stone.css(".temp").text
        #           # stone.css("img").each {|item| puts item.css("title")}
        #           puts stone.css("img")[0]["title"]
        #       end
        # 
        puts @weather_summary
    end

end