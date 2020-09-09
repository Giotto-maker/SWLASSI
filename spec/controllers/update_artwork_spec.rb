require "rails_helper"

RSpec.describe ArtworksController do

    before(:all) do
        @test_user1 = User.create!(:email => ENV['TEST_USER_EMAIL'], :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 4, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @test_user2 = User.create!(:email => 'test@testing.com', :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 2, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @test_user3 = User.create!(:email => 'testing@test.com', :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 0, :password => ENV['TEST_USER_PSW'], 
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

    
    it "should NOT update the artwork if the user is a base user" do
        sign_in @test_user3
        get :update, params: {id: @colosseum.id}

        expect(response.status) == 403
        expect(response.body) == "redirected"
    end

    it "should NOT update the artwork if the user is a base user" do
        sign_in @test_user2
        get :update, params: {id: @colosseum.id}

        expect(response.status) == 403
        expect(response.body) == "redirected"
    end

    it "should NOT update the artwork if time constraint is not respected" do
        sign_in @test_user1
        @colosseum.updated_at = DateTime.now
        get :update, params: {id: @colosseum.id}

        expect(response.status) == 400
        expect(response.body.include? 'minutes before you can update this artwork').to be_truthy
    end

    it "should update the artwork if the user is an admin and everything went just fine" do
        sign_in @test_user1
        get :update, params: {id: @colosseum.id,
            category: 'star', 
            name: 'test', 
            author: 'test',
            timePeriod: 'test',
            dimension: 'test',
            place: 'test',
            lat: 1.0,
            long: 1.0,
            foto1: 'test',
            foto2: 'test',
            foto3: 'test',
            foto4: 'test',
            foto5: 'test'
        }

        expect(response.status) == 200
        expect(@colosseum.nome) == 'test'
        expect(@colosseum.categoria)
        expect(@colosseum.autore) == 'test'
        expect(@colosseum.periodo) == 'test'
        expect(@colosseum.dimensioni) == 'test'
        expect(@colosseum.indirizzo) == 'test'
        expect(@colosseum.latitudine) == 1.0
        expect(@colosseum.longitudine) == 1.0
        expect(@colosseum.foto1) == 'test'
        expect(@colosseum.foto2) == 'test'
        expect(@colosseum.foto3) == 'test'
        expect(@colosseum.foto4) == 'test'
        expect(@colosseum.foto5) == 'test'
    end

end