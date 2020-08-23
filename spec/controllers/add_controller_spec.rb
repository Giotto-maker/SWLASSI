require 'rails_helper'


RSpec.describe ArtworksController, :type => :controller do
    describe "Add new artwork" do
        describe "POST artworks#new_artwork_admin" do
            context "when an admin adds an artwork" do
                it "should add the new artwork in artwork's db" do
                    # artwork = Artwork.create(nome: 'prova', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                    # expect(Artwork.last.nome).to eq('prova')
                    post :new_artwork_admin, params: { :artwork => { :nome => 'ArtworkTest', :autore => 'Author', :categoria => 'Category', :periodo => '1900', :dimensioni => '20 metri', :voto => '5', :valutazioni =>'20', :indirizzo => 'Musei Vaticani', :latitudine => '9.9', :longitudine => '9.9', :foto1 => 'https:ciao.it', :foto2 => 'https:ciao.it', :foto3 => 'https:ciao.it', :foto4 => 'https:ciao.it', :foto5 => 'https:ciao.it'} }
                    expect(Artwork.last.nome).to eq('ArtworkTest')
                end
            end
        end

        describe "POST artworks#new_artwork_lover" do
            context "when an artlover adds an artwork" do
                it "should add the new artwork in artwork's db" do
                    post :new_artwork_lover, params: { :artwork => { :nome => 'ArtworkTest', :autore => 'Author', :categoria => 'Category'} } 
                    expect(Artwork.last.nome).to eq('ArtworkTest')
                end
            end
        end

    end
end
