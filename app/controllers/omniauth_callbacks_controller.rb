class OmniauthCallbacksController < Devise::OmniauthCallbacksController
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
  
    def failure
      redirect_to root_path
    end

    def google_oauth2
      auth = request.env["omniauth.auth"]
      user = User.where(provider: auth["provider"], uid: auth["uid"])
              .first_or_initialize(email: auth["info"]["email"])
      user.name ||= auth["info"]["name"]
      user.password = '12345678'
      user.save!
  
      user.remember_me = true
      user.skip_confirmation!
      sign_in(:user, user)
  
      redirect_to after_sign_in_path_for(user)
    end
end