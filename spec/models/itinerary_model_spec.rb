require 'rails_helper'

RSpec.describe Itinerary do

    before(:all) do

        @test_user = User.create!(:email => ENV['TEST_USER_EMAIL'], :name => ENV['TEST_USER_NAME'], :surname => ENV['TEST_USER_SURNAME'],
        :username => ENV['TEST_USER_USERNAME'] , :category => 'Architecture', :roles_mask => 4, :password => ENV['TEST_USER_PSW'], 
        :password_confirmation => ENV['TEST_USER_PSW'], confirmed_at: Time.now.utc)

        @artwork1 = Artwork.create!(:voto=>5,:valutazioni=>143,:periodo=>"72 d.C",:nome=>"Anfiteatro Flavio",:indirizzo=>"Via del Colosseo",
        :foto5=>"https://d9k3q4j9.stackpathcdn.com/wp-content/uploads/2016/10/Colosseo-laptop_1040_529-815x500.jpeg",
        :foto4=>"https://www.focus.it/site_stored/imgs/0003/038/corbis-42-41640358.630x360.jpg",
        :foto3=>"https://a.travel-assets.com/findyours-php/viewfinder/images/res40/92000/92809.jpg",
        :foto2=>"https://previews.123rf.com/images/salvo77na/salvo77na1610/salvo77na161000055/63898816-irome-italia-1-maggio-2016-interno-del-colosseo-anfiteatro-flavio-%C3%A8-il-pi%C3%B9-importante-anfiteatro-romano-no.jpg",
        :foto1=>"https://www.ansa.it/webimages/ch_600x/2019/3/5/76fcd09c26f25b9c45ad4bb003b781da.jpg",
        :autore=>"Romans",:dimensioni=>"527m (perimeter)",:categoria=>"star",:latitudine=>41.892345,:longitudine=>12.490353)
    
        @artwork2 = Artwork.create!(:voto=>5,:valutazioni=>200,:periodo=>"1536-1541",:nome=>"Giudizio Universale",:indirizzo=>"Cappella Sistina, Musei Vaticani",
        :foto5=>"https://civitavecchia.portmobility.it/sites/default/files/michelangelo_-_giudizio_universale_-_autoritratto.jpg",
        :foto4=>"https://aleteiaitalian.files.wordpress.com/2016/05/cappella-sistina_hero.jpg?quality=100&strip=all&w=620&h=310&crop=1",
        :foto3=>"https://1.bp.blogspot.com/-l-Y-T5nVfZA/WWs0QTzuGII/AAAAAAAACdU/ptpKKS4OvzkSVfUVcpMTfKfByOSNDprAQCLcBGAs/w1200-h630-p-k-no-nu/800px-Michelangelo%252C_Giudizio_Universale_02.jpg",
        :foto2=>"https://i2.wp.com/www.lostradone.it/wp-content/uploads/2018/10/I-Santi-del-Giudizio-Universale-di-Michelangelo-in-Vaticano.jpg?fit=1175%2C768",
        :foto1=>"https://upload.wikimedia.org/wikipedia/commons/a/a5/Michelangelo%2C_Giudizio_Universale_02.jpg",
        :autore=>"Michelangelo",:dimensioni=>"1370x1200cm",:categoria=>"star",:latitudine=>41.90507,:longitudine=>12.45498)

        @artwork3 = Artwork.create!(:voto=>4,:valutazioni=>72,:periodo=>"1903",:nome=>"Villa Borghese",:indirizzo=>"Piazzale Flaminio",
        :foto5=>"https://www.ilfoglio.it/resizer/1200/720/true/1506072775093_1506072797.JPG--i_reduci_e_i_mostri_di_villa_borghese.JPG?1506072797000",
        :foto4=>"https://s1.1zoom.me/big0/717/Italy_Rome_Villa_Lake_Villa_Borghese_Palma_Shrubs_518450_1365x1024.jpg",
        :foto3=>"https://i2.res.24o.it/images2010/Editrice/ILSOLE24ORE/MODA24/2016/07/13/Moda24/ImmaginiWeb/galleria-borghese-835.jpg",
        :foto2=>"https://www.turismoroma.it/sites/default/files/Villa-Borghese.jpg",
        :foto1=>"https://hips.hearstapps.com/cit.h-cdn.co/assets/17/26/1498485385-villa-borghese-roma-info.jpg",
        :autore=>"Luigi Canina",:dimensioni=>"8 km quadri",:categoria=>"star",:latitudine=>41.911667,:longitudine=>12.476096)

        @artwork4 = Artwork.create!(:voto=>4,:valutazioni=>65,:periodo=>"1900",:nome=>"Piazza di Spagna",:indirizzo=>"Piazza di Spagna",
        :foto5=>"https://civitavecchia.portmobility.it/sites/default/files/piazza_di_spagna_-_scalinata_in_fiore.jpg",
        :foto4=>"https://previews.123rf.com/images/sandrixroma/sandrixroma1603/sandrixroma160300002/55402968-italia-roma-piazza-di-spagna-2015-12-13-montagne-trinita-chiuso-per-restauro-in-corso-c-%C3%A8-modo-di-s.jpg",
        :foto3=>"https://www.turismoroma.it/sites/default/files/piazza-di-spagna.jpg",
        :foto2=>"https://www.rome-accommodation.net/assets/Uploads/monuments/monument/PiazzaSpagna.jpg",
        :foto1=>"https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/piazza-di-spagna-roma-curiosita-1579706908.jpg",
        :autore=>"Francesco De Sanctis",:dimensioni=>"Non disponibile",:categoria=>"star",:latitudine=>41.905748,:longitudine=>12.482129)

        @artwork5 = Artwork.create!(:voto=>5,:valutazioni=>165,:periodo=>"1885-1935",:nome=>"Vittoriano",:indirizzo=>"Basilica di Sant'Agostino in Campo Marzio",
        :foto5=>"https://img2.tgcom24.mediaset.it/binary/fotogallery/ansa/32.$plit/C_2_fotogallery_3083764_48_image.jpg?20171104125839",
        :foto4=>"https://upload.wikimedia.org/wikipedia/commons/9/92/Altare_della_patria_di_notte.jpg",
        :foto3=>"https://www.noidiroma.com/wp-content/uploads/2014/04/vittoriano-roma-monumento.jpg",
        :foto2=>"https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Vittoriano%2C_detail%2C_Rome%2C_Italy.jpg/1200px-Vittoriano%2C_detail%2C_Rome%2C_Italy.jpg",
        :foto1=>"https://www.touringclub.it/sites/default/files/styles/gallery_full/public/immagini_georiferite/y_186577251.jpg?itok=JRyVxnq3",
        :autore=>"Giuseppe Sacconi",:dimensioni=>"81 metri",:categoria=>"star",:latitudine=>41.900937,:longitudine=>12.474271)

        @artwork6 = Artwork.create!(:voto=>4,:valutazioni=>100,:periodo=>"XVI sec",:nome=>"Piazza Navona",:indirizzo=>"Piazza Navona",
        :foto5=>"https://media.rds.it/web/wp-content/uploads/2020/04/piazza-navona-torna-verde.jpg",
        :foto4=>"https://fromhometorome.com/wp-content/uploads/2018/03/Piazza_Navona.jpg",
        :foto3=>"https://www.wantedinrome.com/i/preview/storage/uploads/2019/11/Piazza_Navona_Rome_Info.jpeg",
        :foto2=>"https://d9k3q4j9.stackpathcdn.com/wp-content/uploads/2019/09/piazza-navona.jpg",
        :foto1=>"https://www.10cose.it/wp-content/uploads/2016/05/piazza-navona-roma.jpg",
        :autore=>"Bernini/Borromini",:dimensioni=>"265 metri",:categoria=>"star",:latitudine=>41.898916,:longitudine=>12.473119)

        @artwork7 = Artwork.create!(:voto=>4,:valutazioni=>198,:periodo=>"IV sec/I sec d.C",:nome=>"Largo Argentina",:indirizzo=>"Largo di Torre Argentina",
        :foto5=>"https://i.pinimg.com/originals/98/63/12/9863120385e4e1d4bd8121db6770388b.jpg",
        :foto4=>"https://www.artwave.it/wp/wp-content/uploads/2018/04/largo-di-torre-argentina-1024x680.jpg",
        :foto3=>"https://blog.urbanfile.org/wp-content/uploads/2019/02/2019-Roma_Largo_Argentina_Area_Archeologica_1-1024x576.jpg",
        :foto2=>"https://civitavecchia.portmobility.it/sites/default/files/scavi_di_torre_argentina_2.jpg",
        :foto1=>"https://www.sitiarcheologiciditalia.it/wp-content/uploads/2018/03/TORRE-ARGENTINA1.jpg",
        :autore=>"Romani",:dimensioni=>"Non disponibile",:categoria=>"star",:latitudine=>41.896081,:longitudine=>12.476803)
    end

    after(:all) do
        User.delete_all
        Artwork.delete_all
    end

    subject { described_class.create(:artwork1_id => @artwork1.id,
    :artwork2_id => @artwork2.id, :artwork3_id => @artwork3.id, :artwork4_id => @artwork4.id,
    :artwork5_id => @artwork5.id, :artwork6_id => @artwork6.id, :artwork7_id => @artwork7.id,
    :user_id => @test_user.id) }

    describe "instantiation" do

        it "is valid with valid attributes" do
            expect(subject).to be_valid
        end

        it "is NOT valid if the artworks do not belong to the same category" do
            @artwork7.categoria = 'sculpture'
            @artwork7.save!

            model = described_class.create(:artwork1_id => @artwork1.id,
            :artwork2_id => @artwork2.id, :artwork3_id => @artwork3.id, :artwork4_id => @artwork4.id,
            :artwork5_id => @artwork5.id, :artwork6_id => @artwork6.id, :artwork7_id => @artwork7.id,
            :user_id => @test_user.id)
            
            expect(model).to_not be_valid

        end

    end

    describe "assosiation" do
        it { should belong_to(:user) }
        
        it { should belong_to(:artwork1) }
        it { should belong_to(:artwork2) }
        it { should belong_to(:artwork3) }
        it { should belong_to(:artwork4) }
        it { should belong_to(:artwork5) }
        it { should belong_to(:artwork6) }
        it { should belong_to(:artwork7) }
    end

end