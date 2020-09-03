class ArtworksController < ApplicationController
    layout false
    before_action :authenticate_user!
    require 'time_difference'

    def index
        @category = params['category']
        @name = params['searchName']
        @author = params['searchAuthor']

        #render html: @category.to_s
        #return;

        # search by author
        if @category == 'choose' and @name == '' and @author != '' 
            @artworks = Artwork.where(["autore = ?", @author])
        # search by name
        elsif 
            @category == 'choose' and @name != '' and @author == '' 
            @artworks = Artwork.where(["nome = ?", @name])
        # search by category == All
        elsif 
            @category == 'all' and @name == '' and @author == ''
            @artworks = Artwork.all
        # search by category
        elsif 
            @category != 'choose' and @name == '' and @author == '' 
            @artworks = Artwork.where(["categoria = ?", @category])


        # search by name and author
        elsif (@category == 'choose' || @category == 'all') and @name != '' and @author != ''
            @artworks = Artwork.where(["nome = ? and autore = ?", @name , @author])
        # search by name and category
        elsif @category != 'choose' and @name != '' and @author == ''
            @artworks = Artwork.where(["nome = ? and categoria = ?", @name , @category]) 
        # search by category and author
        elsif @category != 'choose'  and @name == '' and @author != ''
            @artworks = Artwork.where(["categoria = ? and autore = ?", @category , @author]) 


        # search by category, author and name
        else
            @artworks = Artwork.where(["categoria = ? and nome = ? and autore = ?", @category , 
            @name , @author])
        end

        authorize! :look_for_artwork, @artworks[0], :message => 'You need to be an artlover to look for artworks'
    end



    def new_artwork_lover
        this_user = current_user.id
        if Artwork.find_by(nome: params[:name], autore: params[:author])
            render html: 'Artwork already exists'
            return
        end

        begin
            ActiveRecord::Base.transaction do
                artw = Artwork.create!(nome: params[:name], autore: params[:author], categoria: params[:category])
                authorize! :create_artwork_with_lover_permission, artw, :message => 'Forbidden'
                lover_creation = LoverCreation.create!(user_id: this_user, artwork_id: artw.id)
                authorize! :create, lover_creation, :message => 'Forbidden'
            end
        rescue CanCan::AccessDenied
            raise
        rescue Exception => error
            render html: 'An error occurred while creating artwork : ' + error.to_s
        else
            render html: 'Artwork successfuly added!'
        end
    end


    def new_artwork_admin
        if Artwork.find_by(nome: params[:name], autore: params[:author])
            render html: 'Artwork already exists'
            return
        end
        
        begin
            ActiveRecord::Base.transaction do

                artw = Artwork.create!(nome: params[:name], 
                autore: params[:author],
                categoria: params[:category],
                periodo: params[:timePeriod],
                dimensioni: params[:dimension], 
                voto: params[:vote], 
                valutazioni: params[:valutations],
                indirizzo: params[:place],
                latitudine: params[:lat],
                longitudine: params[:long],
                foto1: params[:foto1],
                foto2: params[:foto2],
                foto3: params[:foto3],
                foto4: params[:foto4],
                foto5: params[:foto5])

                authorize! :create_artwork_with_admin_permission, artw, :message => 'Forbidden'
                admin_creation = AdminCreation.create!(user_id: current_user.id, artwork_id: artw.id)
                authorize! :create, admin_creation, :message => 'Forbidden'
            end

        rescue CanCan::AccessDenied
            raise
        rescue Exception => error
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

        begin
            artwork = Artwork.find(params[:id])

            if !artwork.voto || !artwork.valutazioni || !artwork.periodo || !artwork.dimensioni || !artwork.indirizzo || !artwork.latitudine || !artwork.longitudine
                raise CanCan::AccessDenied 
            end

            authorize! :require_additional_infos, artwork, :message => 'You need to be an artlover to read more!'
        rescue CanCan::AccessDenied
            raise
        rescue => error
            render html: error.to_s
            return
        end

        artwork_name = artwork.nome + '.txt'
        file_name = Rails.root.join("public", "Infos", artwork_name.to_s)
        infos = ''

        begin 
            File.open(file_name.to_s, "r") do |f|
                f.each_line do |line|
                        infos += line
                    end
                end
        rescue => error
            render html: 'This error has occured : ' + error.to_s
        else
            render html: '' + infos
        end
    end



    def edit
        id = params[:id]
        @artwork = Artwork.find(id)
        authorize! :update, @artwork, :message => 'Forbidden'
    end



    def update
        @artwork = Artwork.find(params[:id])
        authorize! :update, @artwork, :message => 'Forbidden'

        # check time constraint
        start_time = @artwork.updated_at
        end_time = DateTime.now()
        elapsed_sec = TimeDifference.between(start_time, end_time).in_seconds.to_i
        if elapsed_sec < 3600
            left_time = (3600 - elapsed_sec)/60
            render html: 'Still ' + left_time.to_s + ' minutes before you can update this artwork'
            return
        end

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
        @artwork.updated_at = DateTime.now()

        begin
            @artwork.save!
        rescue => error
            render html: 'Could not save artwork : ' + error.to_s
            return
        end

        render html: 'Artworks updated!'
	end



	def destroy
        id = params[:id]
        this_user = current_user.id

        begin
            ActiveRecord::Base.transaction do
                @artwork = Artwork.find(id)
                authorize! :destroy, @artwork, :message => 'Forbidden'
                del = Deletion.create!(user_id: this_user, artwork_id: @artwork.id)
                authorize! :destroy, del, :message => 'Forbidden'
                @artwork.destroy!
            end
        rescue CanCan::AccessDenied
            raise
        rescue => error
            render html: 'Cannot delete artwork : ' + error.to_s
            return;
        end

        render html: 'Artwork deleted'
    end

end
