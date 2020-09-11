class VisitController < ApplicationController
    require 'open_weather'
    require 'json'

    layout false

    def new
        # retrieve list of artworks :
        if (user_signed_in?)
            @artworks = Artwork.where(["categoria = ?", current_user.category.downcase]).order(voto: :desc).limit(7)
        else
            @artworks = Artwork.where(categoria: 'star').order(voto: :desc).limit(7)
        end

        #create a new itinerary to save in the database
        if (user_signed_in?)
            begin
                Itinerary.create!(artwork1_id: @artworks[0].id, artwork2_id: @artworks[1].id, artwork3_id: @artworks[2].id,
                artwork4_id: @artworks[3].id, artwork5_id: @artworks[4].id, artwork6_id: @artworks[5].id,
                artwork7_id: @artworks[6].id, user_id: current_user.id)
            rescue => error
                render html: 'Error creating a new itinerary' + error.to_s
                return
            end
        end

        # retrieve weather infos from external API
        options = { units: "metric", APPID: ENV['OPEN_WEATHER_API_KEY'] }
        begin
            weather_json = OpenWeather::Current.city("Rome, IT", options)
        rescue => error
            render html: 'There was an issue while retriving the weather informations' + error.to_s
        end
        weather_parsed = JSON.parse(weather_json.to_json)

        description_parsed = JSON.parse(weather_parsed['weather'].to_json)
        @main = description_parsed[0]['main']
        @description =  description_parsed[0]['description']

        temp_parsed = JSON.parse(weather_parsed['main'].to_json)
        @temp = temp_parsed['temp']
    end


    def show
        if !user_signed_in?
            render html: 'Template of a visit for external user'
        else
            render html: 'Template of a custom visit'
        end
    end
end
