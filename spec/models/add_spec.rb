require 'rails_helper'

RSpec.describe Artwork, :type => :model do
    describe "a new artwork" do
        context "when user is admin" do
            it "is not valid without a name" do
                artwork = Artwork.create(autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid
            end 
            it "is not valid without a category" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid
            end
            it "is not valid without an author" do
                artwork = Artwork.create(nome: 'Artwork', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without a time period" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without dimensions" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without vote" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without valutations" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without place and address" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without photo1" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without photo2" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without photo3" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without photo4" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without photo5" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without latitude" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', longitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is not valid without longitude" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9')
                expect(artwork).to_not be_valid 
            end
            it "is valid with valid attributes" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category', periodo: '1900', dimensioni: '20 metri', voto: '5', valutazioni: '20', indirizzo: 'Musei Vaticani', foto1: 'https:ciao.it', foto2: 'https:ciao.it', foto3: 'https:ciao.it', foto4: 'https:ciao.it', foto5: 'https:ciao.it', latitudine: '9.9', longitudine: '9.9')
                expect(artwork).to be_valid
            end
        end

        context "when user is artlover" do
            it "is not valid without a name" do
                artwork = Artwork.create(autore: 'Author', categoria: 'Category')
                expect(artwork).to_not be_valid
            end 
            it "is not valid without a category" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author')
                expect(artwork).to_not be_valid
            end
            it "is not valid without an author" do
                artwork = Artwork.create(nome: 'Artwork', categoria: 'Category') 
                expect(artwork).to_not be_valid 
            end
            it "is valid with valid attributes" do
                artwork = Artwork.create(nome: 'Artwork', autore: 'Author', categoria: 'Category')
                expect(artwork).to be_valid
            end
        end

    end
end


   

        
