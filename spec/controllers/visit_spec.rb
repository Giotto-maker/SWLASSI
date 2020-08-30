require "rails_helper"

RSpec.describe VisitController do

    before(:all) do
        @test_user = User.create!(:email => ENV['TEST_USER_EMAIL'], :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 4, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        artwork1_star = Artwork.create!(:voto=>5,:valutazioni=>143,:periodo=>"72 d.C",:nome=>"Anfiteatro Flavio",:indirizzo=>"Via del Colosseo",
        :foto5=>"https://d9k3q4j9.stackpathcdn.com/wp-content/uploads/2016/10/Colosseo-laptop_1040_529-815x500.jpeg",
        :foto4=>"https://www.focus.it/site_stored/imgs/0003/038/corbis-42-41640358.630x360.jpg",
        :foto3=>"https://a.travel-assets.com/findyours-php/viewfinder/images/res40/92000/92809.jpg",
        :foto2=>"https://previews.123rf.com/images/salvo77na/salvo77na1610/salvo77na161000055/63898816-irome-italia-1-maggio-2016-interno-del-colosseo-anfiteatro-flavio-%C3%A8-il-pi%C3%B9-importante-anfiteatro-romano-no.jpg",
        :foto1=>"https://www.ansa.it/webimages/ch_600x/2019/3/5/76fcd09c26f25b9c45ad4bb003b781da.jpg",
        :autore=>"Romans",:dimensioni=>"527m (perimeter)",:categoria=>"star",:latitudine=>41.892345,:longitudine=>12.490353)
    
        artwork2_star = Artwork.create!(:voto=>5,:valutazioni=>200,:periodo=>"1536-1541",:nome=>"Giudizio Universale",:indirizzo=>"Cappella Sistina, Musei Vaticani",
        :foto5=>"https://civitavecchia.portmobility.it/sites/default/files/michelangelo_-_giudizio_universale_-_autoritratto.jpg",
        :foto4=>"https://aleteiaitalian.files.wordpress.com/2016/05/cappella-sistina_hero.jpg?quality=100&strip=all&w=620&h=310&crop=1",
        :foto3=>"https://1.bp.blogspot.com/-l-Y-T5nVfZA/WWs0QTzuGII/AAAAAAAACdU/ptpKKS4OvzkSVfUVcpMTfKfByOSNDprAQCLcBGAs/w1200-h630-p-k-no-nu/800px-Michelangelo%252C_Giudizio_Universale_02.jpg",
        :foto2=>"https://i2.wp.com/www.lostradone.it/wp-content/uploads/2018/10/I-Santi-del-Giudizio-Universale-di-Michelangelo-in-Vaticano.jpg?fit=1175%2C768",
        :foto1=>"https://upload.wikimedia.org/wikipedia/commons/a/a5/Michelangelo%2C_Giudizio_Universale_02.jpg",
        :autore=>"Michelangelo",:dimensioni=>"1370x1200cm",:categoria=>"star",:latitudine=>41.90507,:longitudine=>12.45498)

        artwork3_star = Artwork.create!(:voto=>4,:valutazioni=>72,:periodo=>"1903",:nome=>"Villa Borghese",:indirizzo=>"Piazzale Flaminio",
        :foto5=>"https://www.ilfoglio.it/resizer/1200/720/true/1506072775093_1506072797.JPG--i_reduci_e_i_mostri_di_villa_borghese.JPG?1506072797000",
        :foto4=>"https://s1.1zoom.me/big0/717/Italy_Rome_Villa_Lake_Villa_Borghese_Palma_Shrubs_518450_1365x1024.jpg",
        :foto3=>"https://i2.res.24o.it/images2010/Editrice/ILSOLE24ORE/MODA24/2016/07/13/Moda24/ImmaginiWeb/galleria-borghese-835.jpg",
        :foto2=>"https://www.turismoroma.it/sites/default/files/Villa-Borghese.jpg",
        :foto1=>"https://hips.hearstapps.com/cit.h-cdn.co/assets/17/26/1498485385-villa-borghese-roma-info.jpg",
        :autore=>"Luigi Canina",:dimensioni=>"8 km quadri",:categoria=>"star",:latitudine=>41.911667,:longitudine=>12.476096)

        artwork4_star = Artwork.create!(:voto=>4,:valutazioni=>65,:periodo=>"1900",:nome=>"Piazza di Spagna",:indirizzo=>"Piazza di Spagna",
        :foto5=>"https://civitavecchia.portmobility.it/sites/default/files/piazza_di_spagna_-_scalinata_in_fiore.jpg",
        :foto4=>"https://previews.123rf.com/images/sandrixroma/sandrixroma1603/sandrixroma160300002/55402968-italia-roma-piazza-di-spagna-2015-12-13-montagne-trinita-chiuso-per-restauro-in-corso-c-%C3%A8-modo-di-s.jpg",
        :foto3=>"https://www.turismoroma.it/sites/default/files/piazza-di-spagna.jpg",
        :foto2=>"https://www.rome-accommodation.net/assets/Uploads/monuments/monument/PiazzaSpagna.jpg",
        :foto1=>"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/piazza-di-spagna-roma-curiosita-1579706908.jpg",
        :autore=>"Francesco De Sanctis",:dimensioni=>"Non disponibile",:categoria=>"star",:latitudine=>41.905748,:longitudine=>12.482129)

        artwork5_star = Artwork.create!(:voto=>5,:valutazioni=>165,:periodo=>"1885-1935",:nome=>"Vittoriano",:indirizzo=>"Basilica di Sant'Agostino in Campo Marzio",
        :foto5=>"https://img2.tgcom24.mediaset.it/binary/fotogallery/ansa/32.$plit/C_2_fotogallery_3083764_48_image.jpg?20171104125839",
        :foto4=>"https://upload.wikimedia.org/wikipedia/commons/9/92/Altare_della_patria_di_notte.jpg",
        :foto3=>"https://www.noidiroma.com/wp-content/uploads/2014/04/vittoriano-roma-monumento.jpg",
        :foto2=>"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Vittoriano%2C_detail%2C_Rome%2C_Italy.jpg/1200px-Vittoriano%2C_detail%2C_Rome%2C_Italy.jpg",
        :foto1=>"https://www.touringclub.it/sites/default/files/styles/gallery_full/public/immagini_georiferite/y_186577251.jpg?itok=JRyVxnq3",
        :autore=>"Giuseppe Sacconi",:dimensioni=>"81 metri",:categoria=>"star",:latitudine=>41.900937,:longitudine=>12.474271)

        artwork6_star = Artwork.create!(:voto=>4,:valutazioni=>100,:periodo=>"XVI sec",:nome=>"Piazza Navona",:indirizzo=>"Piazza Navona",
        :foto5=>"https://media.rds.it/web/wp-content/uploads/2020/04/piazza-navona-torna-verde.jpg",
        :foto4=>"https://fromhometorome.com/wp-content/uploads/2018/03/Piazza_Navona.jpg",
        :foto3=>"https://www.wantedinrome.com/i/preview/storage/uploads/2019/11/Piazza_Navona_Rome_Info.jpeg",
        :foto2=>"https://d9k3q4j9.stackpathcdn.com/wp-content/uploads/2019/09/piazza-navona.jpg",
        :foto1=>"https://www.10cose.it/wp-content/uploads/2016/05/piazza-navona-roma.jpg",
        :autore=>"Bernini/Borromini",:dimensioni=>"265 metri",:categoria=>"star",:latitudine=>41.898916,:longitudine=>12.473119)

        artwork7_star = Artwork.create!(:voto=>4,:valutazioni=>198,:periodo=>"IV sec/I sec d.C",:nome=>"Largo Argentina",:indirizzo=>"Largo di Torre Argentina",
        :foto5=>"https://i.pinimg.com/originals/98/63/12/9863120385e4e1d4bd8121db6770388b.jpg",
        :foto4=>"https://www.artwave.it/wp/wp-content/uploads/2018/04/largo-di-torre-argentina-1024x680.jpg",
        :foto3=>"https://blog.urbanfile.org/wp-content/uploads/2019/02/2019-Roma_Largo_Argentina_Area_Archeologica_1-1024x576.jpg",
        :foto2=>"https://civitavecchia.portmobility.it/sites/default/files/scavi_di_torre_argentina_2.jpg",
        :foto1=>"https://www.sitiarcheologiciditalia.it/wp-content/uploads/2018/03/TORRE-ARGENTINA1.jpg",
        :autore=>"Romani",:dimensioni=>"Non disponibile",:categoria=>"star",:latitudine=>41.896081,:longitudine=>12.476803)

        artwork_arch1 = Artwork.create(:voto=>4,:valutazioni=>38,:periodo=>"2002",:nome=>"Auditorium Parco della Musica",:indirizzo=>"Via Pietro de Coubertin, 30, 00196 Roma RM",
        :foto5=>"https://www.turismoroma.it/sites/default/files/auditorium_0.jpg",
        :foto4=>"https://zero-media.s3.amazonaws.com/uploads/2015/06/cavea-auditorium-2.jpg",
        :foto3=>"https://www.teatro.it/images/teatri/2569/main-image/teatro.it-auditorium-parco-della-musica.jpg",
        :foto2=>"https://www.agb.it/getattachment/968f7da8-8785-466c-a952-6b9d8098be00/attachment.aspx",
        :foto1=>"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Orchestra_dell%27Accademia_Nazionale_di_Santa_Cecilia.JPG/1200px-Orchestra_dell%27Accademia_Nazionale_di_Santa_Cecilia.JPG",
        :autore=>"Renzo Piano",:dimensioni=>"capienza di 2800 persone",:categoria=>"architecture",:latitudine=>41.9296419,:longitudine=>12.473146)

        artwork_arch2 = Artwork.create(:voto=>5,:valutazioni=>89,:periodo=>"1889-1911",:nome=>"Palazzo di Giustizia",:indirizzo=>"Piazza Cavour-Piazza dei Tribunali",
        :foto5=>"https://upload.wikimedia.org/wikipedia/commons/a/a0/Roma_2011_08_07_Palazzo_di_Giustizia.jpg",
        :foto4=>"https://imageviaggiart.r.worldssl.net/resources/images/xl/list/image/26176-798e71ee116c563c8102576ff3363c3e-1502338320.jpg",
        :foto3=>"https://3.bp.blogspot.com/--rccA4CunZA/VBMHdDwoiGI/AAAAAAAAD1A/v4PsaYrNb5A/s1600/DSC_0026.jpg",
        :foto2=>"http://www.cortedicassazione.it/cassazione-resources/resources/cms/images/Interno1_d0.jpg",
        :foto1=>"http://www.cortedicassazione.it/cassazione-resources/resources/cms/images/Cortile_1_d0.jpg",
        :autore=>"Guglielmo Calderin",:dimensioni=>"metri 170 x 155",:categoria=>"architecture",:latitudine=>41.9033555,:longitudine=>12.4710604)

        artwork_arch3 = Artwork.create(:voto=>4,:valutazioni=>57,:periodo=>"1957",:nome=>"Palazzetto dello Sport",:indirizzo=>"Piazza Apollodoro",
        :foto5=>"https://upload.wikimedia.org/wikipedia/it/thumb/0/0e/Palazzetto_dello_Sport_Roma.jpg/1920px-Palazzetto_dello_Sport_Roma.jpg",
        :foto4=>"https://www.roma2pass.it/wp-content/uploads/2017/03/pa5-Palazzetto-dello-Sport-1959.jpg",
        :foto3=>"https://upload.wikimedia.org/wikipedia/it/4/41/Palazzetto_dello_Sport_Roma_cropped.jpg",
        :foto2=>"https://media-cdn.tripadvisor.com/media/photo-s/0d/aa/7b/c5/roma-palazzetto-dello.jpg",
        :foto1=>"https://zero-media.s3.amazonaws.com/uploads/2016/09/009-pier-luigi-nervi-palazzetto-dello-sport-theredlist.png",
        :autore=>"Annibale Vitellozzi",:dimensioni=>"4 800 m²",:categoria=>"architecture",:latitudine=>41.92952450442701,:longitudine=>12.470720395265005)

        artwork_arch4 = Artwork.create(:voto=>4,:valutazioni=>90,:periodo=>"1953",:nome=>"Stadio Olimpico",:indirizzo=>"Viale dei Gladiatori",
        :foto5=>"https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/L%27Olimpico_-_panoramio.jpg/1920px-L%27Olimpico_-_panoramio.jpg",
        :foto4=>"https://upload.wikimedia.org/wikipedia/it/thumb/6/6e/Stadio_Olimpico_di_Roma_-_Anni_1950.jpg/1920px-Stadio_Olimpico_di_Roma_-_Anni_1950.jpg",
        :foto3=>"https://upload.wikimedia.org/wikipedia/commons/a/a8/Rome_Olympics_1960_-_Opening_Day.jpg",
        :foto2=>"https://upload.wikimedia.org/wikipedia/it/d/dc/Stadio_Olimpico_-_Roma_-_1989.jpg",
        :foto1=>"https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Stadio_Olimpico_%28Rome%29_-_2014_-_AS_Roma_v_Juventus_FC.jpg/1920px-Stadio_Olimpico_%28Rome%29_-_2014_-_AS_Roma_v_Juventus_FC.jpg",
        :autore=>"A. Vitellozzi e E.  Del Debbio",:dimensioni=>"33 500 m²",:categoria=>"architecture",:latitudine=>41.9339521,:longitudine=>12.4547231)

        artwork_arch5 = Artwork.create(:voto=>4,:valutazioni=>75,:periodo=>"1957",:nome=>"Palazzo dello Sport",:indirizzo=>"Piazzale dello Sport",
        :foto5=>"https://upload.wikimedia.org/wikipedia/it/thumb/b/bc/Roma_Palazzo_dello_Sport_da_Piazzale_dello_Sport.jpg/1920px-Roma_Palazzo_dello_Sport_da_Piazzale_dello_Sport.jpg",
        :foto4=>"https://upload.wikimedia.org/wikipedia/it/thumb/e/e8/Roma_Cascate_Laghetto_EUR_Palazzo_dello_Sport.jpg/1920px-Roma_Cascate_Laghetto_EUR_Palazzo_dello_Sport.jpg",
        :foto3=>"https://upload.wikimedia.org/wikipedia/it/thumb/7/7f/Roma_EUR_Palazzo_dello_Sport_da_viale_America.jpg/1920px-Roma_EUR_Palazzo_dello_Sport_da_viale_America.jpg",
        :foto2=>"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/PalaLottomatica.jpg/1920px-PalaLottomatica.jpg",
        :foto1=>"https://upload.wikimedia.org/wikipedia/it/thumb/1/11/Roma_Palazzo_dello_Sport_da_Piazzale_Pakistan.jpg/1920px-Roma_Palazzo_dello_Sport_da_Piazzale_Pakistan.jpg",
        :autore=>"M. Piacentini e P. L. Nervi",:dimensioni=>"7800 m²",:categoria=>"architecture",:latitudine=>41.8244132,:longitudine=>12.4662537)

        artwork_arch6 = Artwork.create(:voto=>5,:valutazioni=>97,:periodo=>"IV-XVIII secolo",:nome=>"Basilica di San Giovanni in Laterano",:indirizzo=>"Piazza di S. Giovanni in Laterano",
        :foto5=>"https://commons.cathopedia.org/w/images/commons/thumb/c/cc/Roma_Basilica_S_Giovanni.jpg/1600px-Roma_Basilica_S_Giovanni.jpg",
        :foto4=>"https://civitavecchia.portmobility.it/sites/default/files/basilica_di_san_giovanni_e_palazzo.jpg",
        :foto3=>"https://civitavecchia.portmobility.it/sites/default/files/san_giovanni_-_soffitto.jpg",
        :foto2=>"https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/210SGiovanniLaterano.JPG/270px-210SGiovanniLaterano.JPG",
        :foto1=>"https://civitavecchia.portmobility.it/sites/default/files/san_giovanni_in_laterano_-_chiostro.jpg",
        :autore=>"Francesco Borromin",:dimensioni=>"oltre 5.097 m²",:categoria=>"architecture",:latitudine=>41.886106,:longitudine=>12.50397)

        artwork_arch7 = Artwork.create(:voto=>4,:valutazioni=>84,:periodo=>"completata nel XVIII secolo",:nome=>"Basilica di Santa Maria Maggiore",:indirizzo=>"Piazza di S. Maria Maggiore",
        :foto5=>"https://commons.cathopedia.org/w/images/commons/0/03/Basilica_Santa_Maria_Maggiore.jpg",
        :foto4=>"https://upload.wikimedia.org/wikipedia/commons/2/2d/Roma_-_2016-05-23_-_Basilica_di_Santa_Maria_Maggiore_-_2957.jpg",
        :foto3=>"https://upload.wikimedia.org/wikipedia/commons/7/79/Roma_-_Santa_Maria_Maggiore_-_Abside.jpg",
        :foto2=>"https://www.turismoroma.it/sites/default/files/santa-maria-maggiore.jpg",
        :foto1=>"https://mywowo.net/media/images/cache/roma_chiesa_santa_maria_maggiore_01_storia_esterno_jpg_1200_630_cover_85.jpg",
        :autore=>"Ferdinando Fuga",:dimensioni=>"2752 m²",:categoria=>"architecture",:latitudine=>41.8976268,:longitudine=>12.49847)
    end

    after(:all) do
        User.delete_all
        Artwork.delete_all
    end

    after(:each) do
        @test_user.category = 'Architecture'
        @test_user.save
    end


    it "should return successfully when visit is requested" do
        get :new
        expect(response.status).to be(200)
    end

    it "should return no suggestions if there are not artworks of the given category" do
        sign_in @test_user
        @test_user.category = 'Sculpture'
        @test_user.save

        get :new

        suggested_artworks = assigns(:artworks)

        expect(response.status).to be(200)
        expect(suggested_artworks[0]).to be_nil
        expect(suggested_artworks[1]).to be_nil
        expect(suggested_artworks[2]).to be_nil
        expect(suggested_artworks[3]).to be_nil
        expect(suggested_artworks[4]).to be_nil
        expect(suggested_artworks[5]).to be_nil
        expect(suggested_artworks[6]).to be_nil
    end

    it "should suggest star artworks if the user is not logged in" do
        get :new

        suggested_artworks = assigns(:artworks)
        expect(suggested_artworks).not_to be_nil
        expect(suggested_artworks[0].categoria).to eq('star')
    end

    it "should suggest artworks of the favorite user category if user is logged in" do
        sign_in @test_user
        get :new

        user_category = @test_user.category
        suggested_artworks = assigns(:artworks)

        expect(suggested_artworks).not_to be_nil
        expect(suggested_artworks[0].categoria).to eq(user_category.downcase)
    end 

    it "should suggest artworks of the same category" do
        get :new

        suggested_artworks = assigns(:artworks)
        suggestion1 = suggested_artworks[0]
        suggestion2 = suggested_artworks[1]
        suggestion3 = suggested_artworks[2]
        suggestion4 = suggested_artworks[3]
        suggestion5 = suggested_artworks[4]
        suggestion6 = suggested_artworks[5]
        suggestion7 = suggested_artworks[6]

        expect(suggested_artworks).not_to be_nil
        expect(suggestion1.categoria).to eq(suggestion2.categoria)
        expect(suggestion2.categoria).to eq(suggestion3.categoria)
        expect(suggestion3.categoria).to eq(suggestion4.categoria)
        expect(suggestion4.categoria).to eq(suggestion5.categoria)
        expect(suggestion5.categoria).to eq(suggestion6.categoria)
        expect(suggestion6.categoria).to eq(suggestion7.categoria)
    end

    it "should suggested artworks in descending vote order" do
        get :new

        suggested_artworks = assigns(:artworks)
        suggestion1 = suggested_artworks[0]
        suggestion2 = suggested_artworks[1]
        suggestion3 = suggested_artworks[2]
        suggestion4 = suggested_artworks[3]
        suggestion5 = suggested_artworks[4]
        suggestion6 = suggested_artworks[5]
        suggestion7 = suggested_artworks[6]

        expect(suggested_artworks).not_to be_nil
        expect(suggestion1.voto).to be >= suggestion2.voto
        expect(suggestion2.voto).to be >= suggestion3.voto
        expect(suggestion3.voto).to be >= suggestion4.voto
        expect(suggestion4.voto).to be >= suggestion5.voto
        expect(suggestion5.voto).to be >= suggestion6.voto
        expect(suggestion6.voto).to be >= suggestion7.voto
    end

    it "should retrieve wheater conditions from OpenWeather" do
        get :new

        expect(assigns(:main)).not_to be_nil
        expect(assigns(:temp)).not_to be_nil
        expect(assigns(:description)).not_to be_nil
    end

    it "should NOT create itinerary record if user is NOT logged in" do
        get :new

        itineraries = Itinerary.all
        expect(itineraries[0]).to be_nil
    end

    it "should create itinerary record if user is logged in" do
        sign_in @test_user
        get :new

        itineraries = Itinerary.all
        expect(itineraries[0]).not_to be_nil
    end
  
end
