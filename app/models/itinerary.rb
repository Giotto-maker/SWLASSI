class Itinerary < ApplicationRecord

    belongs_to :artwork1, class_name: "Artwork", foreign_key: 'artwork1_id'
    belongs_to :artwork2, class_name: "Artwork", foreign_key: 'artwork2_id'
    belongs_to :artwork3, class_name: "Artwork", foreign_key: 'artwork3_id'
    belongs_to :artwork4, class_name: "Artwork", foreign_key: 'artwork4_id'
    belongs_to :artwork5, class_name: "Artwork", foreign_key: 'artwork5_id'
    belongs_to :artwork6, class_name: "Artwork", foreign_key: 'artwork6_id'
    belongs_to :artwork7, class_name: "Artwork", foreign_key: 'artwork7_id'

    belongs_to :user

    validate :artworks_have_same_category, on: :create

    def artworks_have_same_category
        art1 = Artwork.find(self[:artwork1_id])
        art2 = Artwork.find(self[:artwork2_id])
        art3 = Artwork.find(self[:artwork3_id])
        art4 = Artwork.find(self[:artwork4_id])
        art5 = Artwork.find(self[:artwork5_id])
        art6 = Artwork.find(self[:artwork6_id])
        art7 = Artwork.find(self[:artwork7_id])

        errors.add(:user_id, 'Wrong category') unless (art1.categoria == art2.categoria && art2.categoria == art3.categoria && art4.categoria == art5.categoria && art6.categoria == art7.categoria)
    end
end
