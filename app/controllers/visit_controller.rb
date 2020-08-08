class VisitController < ApplicationController
    require 'open_weather'
    require 'json'

    layout false

    
    def visit_weather
        options = { units: "metric", APPID: "c5306bba2af4c6f13a4092103cda0787" }
        weather_json = OpenWeather::Current.city("Rome, IT", options)
        weather_parsed = JSON.parse(weather_json.to_json)

        description_parsed = JSON.parse(weather_parsed['weather'].to_json)
        @main = description_parsed[0]['main']
        @description =  description_parsed[0]['description']

        temp_parsed = JSON.parse(weather_parsed['main'].to_json)
        @temp = temp_parsed['temp']

        p @main
        p @description
        p @temp
    end
       

    def new
        # retrieve list of artworks :
        @artworks = Artwork.all

        # retrieve weather infos from external API
        options = { units: "metric", APPID: ENV['OPEN_WEATHER_API_KEY'] }
        weather_json = OpenWeather::Current.city("Rome, IT", options)
        weather_parsed = JSON.parse(weather_json.to_json)

        description_parsed = JSON.parse(weather_parsed['weather'].to_json)
        @main = description_parsed[0]['main']
        @description =  description_parsed[0]['description']

        temp_parsed = JSON.parse(weather_parsed['main'].to_json)
        @temp = temp_parsed['temp']
    end

    def show
        render html: 'Template of a visit'
    end
end
