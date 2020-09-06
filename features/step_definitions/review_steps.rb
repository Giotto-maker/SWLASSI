When /^I expect to be on the details page/ do
    art = Artwork.find_by(nome: 'Auditorium Parco della Musica')
    artwork_path(art.id)
end
