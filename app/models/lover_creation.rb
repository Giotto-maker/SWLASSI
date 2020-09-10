class LoverCreation < ApplicationRecord
    belongs_to :artwork
    belongs_to :user

    validate :user_must_be_lover, on: :create

    def user_must_be_lover
        errors.add(:user_id, 'User must be admin') unless User.find(self[:user_id]).roles_mask == 2
    end
end
