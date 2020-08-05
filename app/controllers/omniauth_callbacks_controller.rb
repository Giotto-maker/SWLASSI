class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def failure
      redirect_to '/homepage'
    end

    def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
  
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"] #.except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url
      end
    end


    def google_oauth2
      auth = request.env["omniauth.auth"]
      user = User.find_by(email: auth["info"]["email"])
      if (!user) 
        user = User.new(:email => auth["info"]["email"],
                 :name  => auth["info"]["name"],
                 :category => 'Star',
                 :password => Devise.friendly_token,
                 :provider => auth["provider"] , :uid => auth["uid"])
        user.skip_confirmation!
        user.save!
      end

      user.remember_me = true
      sign_in(:user, user)
  
      redirect_to after_sign_in_path_for(user)
    end
end
