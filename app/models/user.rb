class User < ApplicationRecord

  has_many :reviews
  acts_as_user :roles => [:base, :artlover, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]


        def self.from_omniauth(auth)
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.email = auth.info.email
            user.password = Devise.friendly_token[0, 20]
            user.name = auth.extra.raw_info.first_name 
            user.surname = auth.extra.raw_info.last_name
            # If you are using confirmable and the provider(s) you use validate emails, 
            # uncomment the line below to skip the confirmation emails.
            user.skip_confirmation!
          end
        end

        def self.new_with_session(params, session)
          super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
            end
          end
        end

        # lock users (only if not admin)
        def active_for_authentication?
          super && ( account_active || roles_mask == 4)
        end

        def inactive_message
          account_active ? super : :locked
        end
end
