class Itinerary < ApplicationRecord

    belongs_to :artwork1, class_name: "Artwork", foreign_key: 'artwork1_id'
    belongs_to :artwork2, class_name: "Artwork", foreign_key: 'artwork2_id'
    belongs_to :artwork3, class_name: "Artwork", foreign_key: 'artwork3_id'
    belongs_to :artwork4, class_name: "Artwork", foreign_key: 'artwork4_id'
    belongs_to :artwork5, class_name: "Artwork", foreign_key: 'artwork5_id'
    belongs_to :artwork6, class_name: "Artwork", foreign_key: 'artwork6_id'
    belongs_to :artwork7, class_name: "Artwork", foreign_key: 'artwork7_id'

    belongs_to :user
end
