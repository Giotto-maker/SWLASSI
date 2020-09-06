require "rails_helper"

RSpec.describe ArtworksController do

    before(:all) do
        
        @test_user1 = User.create!(:email => ENV['TEST_USER_EMAIL'], :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 4, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)
        
        @test_user2 = User.create!(:email => 'testing@tests.com', :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 2, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @colosseum = Artwork.create!(:voto=>5,:valutazioni=>143,:periodo=>"72 d.C",:nome=>"Anfiteatro Flavio",:indirizzo=>"Via del Colosseo",
        :foto5=>"https://d9k3q4j9.stackpathcdn.com/wp-content/uploads/2016/10/Colosseo-laptop_1040_529-815x500.jpeg",
        :foto4=>"https://www.focus.it/site_stored/imgs/0003/038/corbis-42-41640358.630x360.jpg",
        :foto3=>"https://a.travel-assets.com/findyours-php/viewfinder/images/res40/92000/92809.jpg",
        :foto2=>"https://previews.123rf.com/images/salvo77na/salvo77na1610/salvo77na161000055/63898816-irome-italia-1-maggio-2016-interno-del-colosseo-anfiteatro-flavio-%C3%A8-il-pi%C3%B9-importante-anfiteatro-romano-no.jpg",
        :foto1=>"https://www.ansa.it/webimages/ch_600x/2019/3/5/76fcd09c26f25b9c45ad4bb003b781da.jpg",
        :autore=>"Romans",:dimensioni=>"527m (perimeter)",:categoria=>"star",:latitudine=>41.892345,:longitudine=>12.490353)
    end

    after(:all) do
        User.delete_all
        Artwork.delete_all
    end


    it "should return successfully when admin endpoint is requested" do
        sign_in @test_user1
        get :new_artwork_admin

        expect(response.status).to be(200)
    end

    it "should return successfully when lover endpoint is requested" do
        sign_in @test_user2
        get :new_artwork_lover

        expect(response.status).to be(200)
    end

    it "should NOT add the arlover artwork if it already exists" do
        sign_in @test_user2
        get :new_artwork_lover, params: {name: 'Anfiteatro Flavio' , author: 'Romans', category: 'star'}

        expect(response.status).to be(200)
        expect(response.body).to eq('Artwork already exists')
    end

    it "should NOT add the admin artwork if it already exists" do
        sign_in @test_user2
        get :new_artwork_admin, params: {name: 'Anfiteatro Flavio' , author: 'Romans', category: 'star'}

        expect(response.status).to be(200)
        expect(response.body).to eq('Artwork already exists')
    end

    it "should NOT add the artwork if the user hasn't the artlover privileges" do
        get :new_artwork_lover, params: {name: 'Test artwork' , author: 'Test author', category: 'star'}
        new_artwork = Artwork.find_by(nome: 'Test artwork', autore: 'Test author')

        expect(response.status) == 403
        expect(new_artwork).to be_nil
    end

    it "should NOT add the artwork if the user hasn't the admin privileges" do
        sign_in @test_user2
        get :new_artwork_admin, params: {name: 'Test artwork' , author: 'Test author', category: 'star'}
        new_artwork = Artwork.find_by(nome: 'Test artwork', autore: 'Test author')

        expect(response.status) == 403
        expect(new_artwork).to be_nil
    end

    it "should add the artwork for artlover if user has artlover permissions and the artwork is not present" do
        sign_in @test_user2
        get :new_artwork_lover, params: {name: 'Test artwork' , author: 'Test author', category: 'star'}
        new_artwork = Artwork.find_by(nome: 'Test artwork', autore: 'Test author')

        expect(response.status).to be(200)
        expect(new_artwork).not_to be_nil
        expect(new_artwork.nome).to eq("Test artwork")
        expect(new_artwork.autore).to eq("Test author")
        expect(new_artwork.categoria).to eq("star")
    end

    it "should add the artwork for admin if user has admin permissions and the artwork is not present" do
        sign_in @test_user1
        get :new_artwork_admin, params: {name: 'Test artwork' , author: 'Test author', category: 'star',
            timePeriod: 'test period' , dimension: 'test dimensions' , vote: 1, valutations: 1,
            place: 'test address', lat: 1.0 , long: 1.0, foto1:'test image', foto2:'test image', 
            foto3:'test image', foto4:'test image', foto5:'test image'}
        new_artwork = Artwork.find_by(nome: 'Test artwork', autore: 'Test author')

        expect(response.status).to be(200)
        expect(new_artwork).not_to be_nil
        expect(new_artwork.nome).to eq("Test artwork")
        expect(new_artwork.autore).to eq("Test author")
        expect(new_artwork.categoria).to eq("star")
        expect(new_artwork.periodo).to eq("test period")
        expect(new_artwork.dimensioni).to eq("test dimensions")
        expect(new_artwork.voto).to be(1)
        expect(new_artwork.valutazioni).to be(1)
        expect(new_artwork.indirizzo).to eq("test address")
        expect(new_artwork.latitudine).to be(1.0)
        expect(new_artwork.longitudine).to be(1.0)
        expect(new_artwork.foto1).to eq("test image")
        expect(new_artwork.foto2).to eq("test image")
        expect(new_artwork.foto3).to eq("test image")
        expect(new_artwork.foto4).to eq("test image")
        expect(new_artwork.foto5).to eq("test image")
    end

    it "should insert a lover creation entry when an artlover successfully creates artwork" do
        sign_in @test_user2
        get :new_artwork_lover, params: {name: 'Test artwork' , author: 'Test author', category: 'star'}
        new_artwork = Artwork.find_by(nome: 'Test artwork', autore: 'Test author')
        artlover_creation = LoverCreation.find_by(artwork_id: new_artwork.id, user_id: @test_user2.id)
    
        expect(response.status).to be(200)
        expect(artlover_creation).not_to be_nil
        expect(artlover_creation.artwork_id).to be(new_artwork.id)
        expect(artlover_creation.user_id).to be(@test_user2.id)
    end

    it "should insert an admin creation entry when an artlover successfully creates artwork" do
        sign_in @test_user1
        get :new_artwork_admin, params: {name: 'Test artwork' , author: 'Test author', category: 'star',
            timePeriod: 'test period' , dimension: 'test dimensions' , vote: 1, valutations: 1,
            place: 'test address', lat: 1.0 , long: 1.0, foto1:'test image', foto2:'test image', 
            foto3:'test image', foto4:'test image', foto5:'test image'}
        new_artwork = Artwork.find_by(nome: 'Test artwork', autore: 'Test author')
        admin_creation = AdminCreation.find_by(artwork_id: new_artwork.id, user_id: @test_user1.id)
    
        expect(response.status).to be(200)
        expect(admin_creation).not_to be_nil
        expect(admin_creation.artwork_id).to be(new_artwork.id)
        expect(admin_creation.user_id).to be(@test_user1.id)
    end
end