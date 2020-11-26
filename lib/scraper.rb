class Scraper
    # Nokogiri
    # Open URL

    attr_reader :url, :url_data

    def self.nws(geo_location)
        lat_val = geo_location.geo_data[:latitude]
        lon_val = geo_location.geo_data[:longitude]

        # @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}&unit=0&lg=english&FcstType=digital" # data table did not really have enough to parse easily, return to this in the future
        @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}"

        self.get_data
    end

    def self.get_data
        puts @url
        @url_data = Nokogiri::HTML(open(@url).read,nil,'utf-8')
        # @url_data.encoding = 'utf-8'

        binding.pry
        # NWS label: @url_data.css("#header-nws").children[0].attributes["alt"].value
        # Current conditions (in progress): 
        #   Title: @url_data.css("#current-conditions").css(".panel-title").text.strip
        #   Summary: 
        #           conditions = @url_data.css("#current_conditions-summary").css("p")
        #           conditions.each {|item| puts item.text}
        #   Details: (in progress - how can I resolve special chars????)
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
        #           # puts stone.css(".period-name").text
        #           # expand => @url_data.css("#seven-day-forecast-list").css(".forecast-tombstone").css(".period-name")[?].children => join strings, replacing empty string with space when there is more than 1 text value
        #           puts stone.css(".short-desc").text
        #           puts stone.css(".temp").text
        #           # stone.css("img").each {|item| puts item.css("title")}
        #           puts stone.css("img")[0]["title"]
        #       end
        # 
    end

end