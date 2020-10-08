require 'httparty'

class Geolocation

    response = HTTParty.get('https://api.opencagedata.com/geocode/v1/json?key=d9fd2e09691b4c60b9735145cb396a8a&q=West%20Bloomington+1%2C+99423+Minnesota%2C+United%20States&pretty=1')
    response_json = JSON.parse(response.body)

    puts response_json["results"][2]["geometry"]

end