class Review < ActiveRecord::Base
    belongs_to :artwork
    belongs_to :user

    validates_presence_of :valutation
end