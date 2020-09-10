class AdminCreation < ApplicationRecord
    belongs_to :artwork
    belongs_to :user

    validate :user_must_be_admin, on: :create

    def user_must_be_admin
        errors.add(:user_id, 'User must be admin') unless User.find(self[:user_id]).roles_mask == 4
    end

end
