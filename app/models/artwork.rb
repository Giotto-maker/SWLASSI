class Artwork < ApplicationRecord
    has_many :reviews

    validates_presence_of :nome
    validates_presence_of :autore
    
    validates :categoria, :inclusion => { :in => ['star', 'architecture', 'sculpture', 'painting'] }, 
    :allow_nil => true
end
