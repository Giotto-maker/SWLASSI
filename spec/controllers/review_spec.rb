require "rails_helper"

RSpec.describe ReviewsController do

    before(:all) do
        @test_user_admin = User.create!(:email => ENV['TEST_USER_EMAIL'], :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 4, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @test_user_artlover = User.create!(:email => 'test1.user@testing.com', :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 2, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @test_user_base = User.create!(:email => 'test2.user@testing.com', :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 0, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @colosseum = Artwork.create!(:voto=>5,:valutazioni=>143,:periodo=>"72 d.C",:nome=>"Anfiteatro Flavio",:indirizzo=>"Via del Colosseo",
        :foto5=>"https://d9k3q4j9.stackpathcdn.com/wp-content/uploads/2016/10/Colosseo-laptop_1040_529-815x500.jpeg",
        :foto4=>"https://www.focus.it/site_stored/imgs/0003/038/corbis-42-41640358.630x360.jpg",
        :foto3=>"https://a.travel-assets.com/findyours-php/viewfinder/images/res40/92000/92809.jpg",
        :foto2=>"https://previews.123rf.com/images/salvo77na/salvo77na1610/salvo77na161000055/63898816-irome-italia-1-maggio-2016-interno-del-colosseo-anfiteatro-flavio-%C3%A8-il-pi%C3%B9-importante-anfiteatro-romano-no.jpg",
        :foto1=>"https://www.ansa.it/webimages/ch_600x/2019/3/5/76fcd09c26f25b9c45ad4bb003b781da.jpg",
        :autore=>"Romans",:dimensioni=>"527m (perimeter)",:categoria=>"star",:latitudine=>41.892345,:longitudine=>12.490353)
    
        @review1 = Review.create!(:valutation => 1 , :comment => 'test comment', :user_id => @test_user_admin.id, :artwork_id => @colosseum.id)
        @review2 = Review.create!(:valutation => 2 , :comment => 'test comment', :user_id => @test_user_artlover.id, :artwork_id => @colosseum.id)
    end

    after(:all) do
        User.delete_all
        Artwork.delete_all
    end


    it "should NOT show any review if user is not logged in" do
        get :show, params: {:artwork_id => @colosseum.id, :id => rand(100)} 

        expect(response.status).to be(302)
        expect(response.body) == 'redirected'
    end

    it "should NOT show any review if user is a Base user" do
        sign_in @test_user_base
        get :show, params: {:artwork_id => @colosseum.id, :id => @test_user_base.id} 

        expect(response.status).to be(302)
        expect(response.body) == 'redirected'
    end

    it "should NOT show any review if no artwork was found with the given id" do
        sign_in @test_user_artlover
        get :show, params: {:artwork_id => rand(1000), :id => @test_user_artlover.id}  
        reviews = assigns(:reviews) 
        artwork = assigns(:artwork)

        expect(response.status).to be(200)
        expect(artwork).to be_nil
        expect(reviews).to be_nil 
    end

    it "should show the review if user us artlover and params are fine" do
        sign_in @test_user_artlover
        get :show, params: {:artwork_id => @colosseum.id ,:id => @test_user_artlover.id}  
        reviews = assigns(:reviews) 
        artwork = assigns(:artwork)

        expect(response.status).to be(200)
        expect(artwork).not_to be_nil
        expect(reviews).not_to be_nil 
        expect(reviews[0].valutation).to be(1)
        expect(reviews[0].comment).to eq('test comment')
    end

    it "should NOT delete the review if the user has base privileges" do
        sign_in @test_user_base
        get :destroy, params: {:artwork_id => @colosseum.id , :id => @review2.id}

        expect(response.status).to be(302)
        expect(@review2).not_to be_nil
        expect(@review2.comment).to eq('test comment')
        expect(@review2.valutation).to be(2)
        expect(response.body) == 'redirected'
    end

    it "should NOT delete the review if the user has artlover privileges" do
        sign_in @test_user_artlover
        get :destroy, params: {:artwork_id => @colosseum.id , :id => @review2.id}

        expect(response.status).to be(302)
        expect(@review2).not_to be_nil
        expect(@review2.comment).to eq('test comment')
        expect(@review2.valutation).to be(2)
        expect(response.body) == 'redirected'
    end

    it "should NOT delete the review if no review was found" do
        sign_in @test_user_admin
        get :destroy, params: {:artwork_id => rand(1000) , :id => @review2.id}

        expect(response.status).to be(302)
        expect(@review2).not_to be_nil
        expect(@review2.comment).to eq('test comment')
        expect(@review2.valutation).to be(2)
        expect(response.body) == 'No review was found with the given id'
    end

    it "should delete the review if the user has admin privileges" do
        sign_in @test_user_admin
        get :destroy, params: {:artwork_id => @colosseum.id , :id => @review2.id}
    
        expect(response.status) == 200
        expect(response).to redirect_to artwork_review_path(@colosseum)
        expect(assigns(:review).destroyed?).to be true
    end

    it "should NOT create/update the review if no artwork was found" do

    end

    it "should NOT create review if artwork has missing informations" do

    end

    it "should NOT update review if it was already updated less than 60 minutes before" do

    end

    it "should create the review if it didn't exist before and all the rest is fine" do

    end

    it "should update the review if it did exis before and all the rest is fine" do

    end

    it "should promoto the base user to artlover if the reviews count is 10" do

    end

end