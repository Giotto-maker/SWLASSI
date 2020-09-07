require 'rails_helper'

RSpec.describe Review do

    before(:all) do
        @test_user = User.create!(:email => ENV['TEST_USER_EMAIL'], :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 4, :password => ENV['TEST_USER_PSW'], 
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

    subject { described_class.new }

    describe "instantiation" do

        it "is valid with valid attributes" do
            subject.valutation = 3
            subject.user_id = @test_user.id
            subject.artwork_id = @colosseum.id

            expect(subject).to be_valid
        end

        it "is NOT valid if the valutaion is missing" do
            subject.user_id = @test_user.id
            subject.artwork_id = @colosseum.id

            expect(subject).to_not be_valid
        end

        it "is NOT valid if the user foreign key is missing" do
            subject.valutation = 3
            subject.artwork_id = @colosseum.id

            expect(subject).to_not be_valid
        end


        it "is NOT valid if the artwork foreign key is missing" do
            subject.valutation = 3
            subject.user_id = @test_user.id

            expect(subject).to_not be_valid
        end

    end


    describe "assosiation" do
        it { should belong_to(:user) }
        it { should belong_to(:artwork) }
    end
end