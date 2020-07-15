class ArtworksController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token #COMPLETE: except: [:create, :update, :destroy]

    def index
        render html: 'List of all artworks'
    end

    def show
        @artwork = Artwork.find(params[:id])
    end

    def update_mark
        @artwork = Artwork.find(params[:id])
        @mark = Integer(params[:mark])
        
        @nuovoVoto = ((@artwork.voto + @mark)/2.0).ceil 
        @nuovaValutazione = @artwork.valutazioni + 1

        @artwork.update_attribute(:voto, @nuovoVoto)
        @artwork.update_attribute(:valutazioni, @nuovaValutazione)

        render html: 'Nome : ' + @artwork.nome + ' Voto : ' + @mark.to_s + ' Valutazioni : ' + @nuovaValutazione.to_s + ' nuovoVoto: ' + @nuovoVoto.to_s
    end

    def more_infos
        @artwork = Artwork.find(params[:id]).nome + '.txt'
        @file_name = Rails.root.join("public", "Infos", @artwork.to_s)
        @infos = ''

        begin 
            File.open(@file_name.to_s, "r") do |f|
                f.each_line do |line|
                        @infos += line
                    end
                end
        rescue => error
            render html: 'This error has occured : ' + error.to_s
        else
            render html: '' + @infos
        end
    end

    def edit
        id = params[:id]
        @artwork = Artwork.find(id)
	end


	def update
        id = params[:id]
        @artwork = Artwork.find(id)
        @artwork.update_attributes!(params[:artwork].permit(:timePeriod, :dimension, :place, :lat, :long, :foto1, :foto2, :foto3, :foto4, :foto5))
		redirect_to '/welcomeHomepage'
	end


	def destroy
		id = params[:id]
		@artwork = Artwork.find(id)
		@artwork.destroy
		redirect_to '/welcomeHomepage'
    end

    def find
        id = params[:id]
        if Artwork.exists?(id)
            @movie = Artwork.find(id)
        else
            render html: 'Artwork does not exit'
        end
    end

end
