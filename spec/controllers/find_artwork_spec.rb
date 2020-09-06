require "rails_helper"

RSpec.describe ArtworksController do

    before(:all) do
        @test_user = User.create!(:email => ENV['TEST_USER_EMAIL'], :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 2, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @argentina = Artwork.create!(:voto=>4,:valutazioni=>198,:periodo=>"IV sec/I sec d.C",:nome=>"Largo Argentina",:indirizzo=>"Largo di Torre Argentina",
        :foto5=>"https://i.pinimg.com/originals/98/63/12/9863120385e4e1d4bd8121db6770388b.jpg",
        :foto4=>"https://www.artwave.it/wp/wp-content/uploads/2018/04/largo-di-torre-argentina-1024x680.jpg",
        :foto3=>"https://blog.urbanfile.org/wp-content/uploads/2019/02/2019-Roma_Largo_Argentina_Area_Archeologica_1-1024x576.jpg",
        :foto2=>"https://civitavecchia.portmobility.it/sites/default/files/scavi_di_torre_argentina_2.jpg",
        :foto1=>"https://www.sitiarcheologiciditalia.it/wp-content/uploads/2018/03/TORRE-ARGENTINA1.jpg",
        :autore=>"Romans",:dimensioni=>"Non disponibile",:categoria=>"star",:latitudine=>41.896081,:longitudine=>12.476803)
    
        @colosseum = Artwork.create!(:voto=>5,:valutazioni=>143,:periodo=>"72 d.C",:nome=>"Anfiteatro Flavio",:indirizzo=>"Via del Colosseo",
        :foto5=>"https://d9k3q4j9.stackpathcdn.com/wp-content/uploads/2016/10/Colosseo-laptop_1040_529-815x500.jpeg",
        :foto4=>"https://www.focus.it/site_stored/imgs/0003/038/corbis-42-41640358.630x360.jpg",
        :foto3=>"https://a.travel-assets.com/findyours-php/viewfinder/images/res40/92000/92809.jpg",
        :foto2=>"https://previews.123rf.com/images/salvo77na/salvo77na1610/salvo77na161000055/63898816-irome-italia-1-maggio-2016-interno-del-colosseo-anfiteatro-flavio-%C3%A8-il-pi%C3%B9-importante-anfiteatro-romano-no.jpg",
        :foto1=>"https://www.ansa.it/webimages/ch_600x/2019/3/5/76fcd09c26f25b9c45ad4bb003b781da.jpg",
        :autore=>"Romans",:dimensioni=>"527m (perimeter)",:categoria=>"star",:latitudine=>41.892345,:longitudine=>12.490353)
    
        @giovanni = Artwork.create(:voto=>5,:valutazioni=>97,:periodo=>"IV-XVIII secolo",:nome=>"Basilica di San Giovanni in Laterano",:indirizzo=>"Piazza di S. Giovanni in Laterano",
        :foto5=>"https://commons.cathopedia.org/w/images/commons/thumb/c/cc/Roma_Basilica_S_Giovanni.jpg/1600px-Roma_Basilica_S_Giovanni.jpg",
        :foto4=>"https://civitavecchia.portmobility.it/sites/default/files/basilica_di_san_giovanni_e_palazzo.jpg",
        :foto3=>"https://civitavecchia.portmobility.it/sites/default/files/san_giovanni_-_soffitto.jpg",
        :foto2=>"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/210SGiovanniLaterano.JPG/270px-210SGiovanniLaterano.JPG",
        :foto1=>"https://civitavecchia.portmobility.it/sites/default/files/san_giovanni_in_laterano_-_chiostro.jpg",
        :autore=>"Francesco Borromin",:dimensioni=>"oltre 5.097 m²",:categoria=>"architecture",:latitudine=>41.886106,:longitudine=>12.50397)
    end

    after(:all) do
        User.delete_all
        Artwork.delete_all
    end

    before(:each) do
        sign_in @test_user
    end

    ##### ONE FIELD SEARCHS ####

        # search by author
    it "should return the artworks made by a given AUTHOR" do
        get :index, params: {searchName: '', searchAuthor: 'Romans', category: 'choose'}

        results = assigns(:artworks)
        expect(response.status) == 200
        expect(results[0].autore).to eq('Romans')
        expect(results[1].autore).to eq('Romans')
        expect(results[2]).to be_nil
    end

        # search by name
    it "should return the artworks entitled with the given NAME" do
        get :index, params: {searchName: 'Anfiteatro Flavio', searchAuthor: '', category: 'choose'}

        results = assigns(:artworks)
        expect(response.status) == 200
        expect(results[0].nome).to eq('Anfiteatro Flavio')
        expect(results[1]).to be_nil
    end

        # search by category
    it "should return the artworks matching the given CATEGORY" do
        get :index, params: {searchName: '', searchAuthor: '', category: 'star'}

        results = assigns(:artworks)
        expect(response.status) == 200
        expect(results[0].categoria).to eq('star')
        expect(results[1].categoria).to eq('star')
        expect(results[2]).to be_nil
    end

        # search by general category
    it "should return all the artworks available" do
        get :index, params: {searchName: '', searchAuthor: '', category: 'all'}

        results = assigns(:artworks)
        expect(response.status) == 200
        expect(results[0].nome).to eq('Largo Argentina')
        expect(results[1].nome).to eq('Anfiteatro Flavio')
        expect(results[2].nome).to eq('Basilica di San Giovanni in Laterano')
    end


    #### TWO FIELDS SEARCH ####

    it "should return the artworks matching the given NAME and AUTHOR" do
        get :index, params: {searchName: 'Anfiteatro Flavio', searchAuthor: 'Romans', category: 'choose'}
    
        results = assigns(:artworks)
        expect(response.status) == 200
        expect(results[0].nome).to eq('Anfiteatro Flavio')
        expect(results[0].autore).to eq('Romans')
        expect(results[1]).to be_nil
    end

    it "should return the artworks matching the given NAME and CATEGORY" do
        get :index, params: {searchName: 'Anfiteatro Flavio', searchAuthor: '', category: 'star'}
    
        results = assigns(:artworks)
        expect(response.status) == 200
        expect(results[0].nome).to eq('Anfiteatro Flavio')
        expect(results[0].categoria).to eq('star')
        expect(results[1]).to be_nil
    end

    it "should return the artworks matching the given CATEGORY and AUTHOR" do
        get :index, params: {searchName: '', searchAuthor: 'Romans', category: 'star'}
    
        results = assigns(:artworks)
        expect(response.status) == 200
        expect(results[0].categoria).to eq('star')
        expect(results[0].autore).to eq('Romans')
        expect(results[1].categoria).to eq('star')
        expect(results[1].autore).to eq('Romans')
        expect(results[2]).to be_nil
    end

    ### THREE FIELDS SEARCH ###
    
    it "should return the artworks matching all the criteria at the same time" do
        get :index, params: {searchName: 'Largo Argentina', searchAuthor: 'Romans', category: 'star'}
    
        results = assigns(:artworks)
        expect(response.status) == 200
        expect(results[0].categoria).to eq('star')
        expect(results[0].autore).to eq('Romans')
        expect(results[0].nome).to eq('Largo Argentina')            
    end


    ### FAILING CASE ###

    it "should return 404 if no artwork was found matching the given criteria" do
        get :index, params: {searchName: '', searchAuthor: '', category: 'sculpture'}

        results = assigns(:artworks)
        expect(response.status) == 404
        expect(results[0]).to be_nil
    end

end