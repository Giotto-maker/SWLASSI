class Artwork < ApplicationRecord
    has_many :reviews
    if User.new(roles_mask.eq(2))
        validates_presence_of :nome
        validates_presence_of :autore
        validates_presence_of :categoria
        validates :nome, presence: true
        validates :autore, presence: true
        validates :categoria, presence: true
    elsif User.new(roles_mask.eq(4))
        validates_presence_of :nome
        validates_presence_of :autore
        validates_presence_of :categoria
        validates_presence_of :periodo
        validates_presence_of :dimensioni
        validates_presence_of :indirizzo
        validates_presence_of :voto
        validates_presence_of :valutazioni
        validates_presence_of :foto1
        validates_presence_of :foto2
        validates_presence_of :foto3
        validates_presence_of :foto4
        validates_presence_of :foto5
        validates_presence_of :latitudine
        validates_presence_of :longitudine
    end

end
