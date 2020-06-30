class VisitController < ApplicationController
    layout false
    def new
        @artworks = Artwork.all
    end

    def show
        render html: 'Template of a visit'
    end
end
