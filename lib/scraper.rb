class Scraper
    # Nokogiri
    # Open URL

    attr_reader :url, :url_data

    def self.nws(geo_location)
        lat_val = geo_location.geo_data[:latitude]
        lon_val = geo_location.geo_data[:longitude]

        @url = "https://forecast.weather.gov/MapClick.php?lat=#{lat_val}&lon=#{lon_val}&unit=0&lg=english&FcstType=digital"

        self.get_data
    end

    def self.get_data
        puts @url
        @url_data = Nokogiri::HTML(open(@url))
        binding.pry
        # puts @url_data
        # title: @url_data.search("title").text
        # doc body: @url_data.search("body")
        # update date: url_body.search("table")[3].children.search("td")[1].text
        # weather body (needs work): url_body.search("table")[7]
    end

end