require "rails_helper"

RSpec.describe ArtworksController do

    before(:all) do
        @test_user = User.create!(:email => 'testing@test.com', :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 1, :password => ENV['TEST_USER_PSW'], 
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

    it "should NOT update the mark if the user is not logged in" do
        get :update_mark, params: {id: @colosseum.id, mark: 5}

        expect(response.status) == 403
        expect(response.body.include? 'redirected').to be_truthy
    end

    it "should update the mark if the user logged in" do
        sign_in @test_user
        get :update_mark, params: {id: @colosseum.id, mark: 3}

        expect(response.status).to be(200)
        expect(response.body.include? 'nuovoVoto').to be_truthy
        expect(assigns(:nuovoVoto)) == 4
    end
end