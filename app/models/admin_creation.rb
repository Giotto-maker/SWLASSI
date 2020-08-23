class AdminCreation < ApplicationRecord
    belongs_to :artwork
    belongs_to :user
end
