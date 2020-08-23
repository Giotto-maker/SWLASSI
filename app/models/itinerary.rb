class Itinerary < ApplicationRecord
    has_many :artworks
    belongs_to :user
end
