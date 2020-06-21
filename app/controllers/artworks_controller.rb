class ArtworksController < ApplicationController

    def index
        render html: 'List of all artworks'
    end

    def show
        render html: 'Artworks details'
    end
end
