class ArtworksController < ApplicationController
    layout false
    skip_before_action :verify_authenticity_token #COMPLETE: except: [:create, :update, :destroy]

    def index
        render html: 'List of all artworks'
    end

    def new
        begin
            Artwork.create(nome: params[:name], 
                        autore: params[:author], 
                        periodo: params[:timePeriod],
                        dimensioni: params[:dimension], 
                        voto: params[:vote], 
                        valutazioni: params[:valutations],
                        indirizzo: params[:place],
                        latitudine: params[:lat],
                        foto1: params[:foto1],
                        foto2: params[:foto2],
                        foto3: params[:foto3],
                        foto4: params[:foto4],
                        foto5: params[:foto5])
        rescue => error
            render html: 'An error occurred while creating artwork : ' + error.to_s
        else
            render html: 'Artwork successfuly added!'
        end
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
        @artwork = Artwork.find(params[:id])

        @artwork.categoria = params[:category]
        @artwork.nome = params[:name]
        @artwork.autore = params[:author]
        @artwork.periodo = params[:timePeriod]
        @artwork.dimensioni = params[:dimension]
        @artwork.indirizzo = params[:place]
        @artwork.latitudine = params[:lat]
        @artwork.longitudine = params[:long]
        @artwork.foto1 = params[:foto1]
        @artwork.foto2 = params[:foto2]
        @artwork.foto3 = params[:foto3]
        @artwork.foto4 = params[:foto4]
        @artwork.foto5 = params[:foto5]

        @artwork.save

        render html: 'Artworks updated!'
	end


	def destroy
		id = params[:id]
		@artwork = Artwork.find(id)
        @artwork.destroy
        render html: 'Artwork deleted'
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
