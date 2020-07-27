class UsersController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
  require 'securerandom'

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    #puts User.where(["name =" @user[:name]])
    # inserire controllo con where
    if @user.save
      log_in @user #per non fare il login dopo la registrazione
      redirect_to '/welcomeHomepage'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def change_psw
    @current_psw = params[:current_psw]
    @new_psw = params[:new_psw]
    @confirm_psw = params[:confirm_psw]

    @user = User.find(session[:user_id])
    @user_psw = @user.password_digest

    if BCrypt::Password.new(@user_psw) != @current_psw
      render html: 'Incorrect password! Please try again'
    elsif @new_psw == '' or @new_psw != @confirm_psw
      render html: 'Passwords do not match!'
    end
    @user.password_digest = BCrypt::Password.create(@new_psw)
    @user.save
    render html: 'Password successfully updated!'
  end

  def forgotten_psw
    @email = params[:email]
    @user = User.find_by(email: @email)

    @token = SecureRandom.base64(20)

    @user.password_digest = BCrypt::Password.create(@token)
    @user.save

    begin
      ContactMailer.send_psw(@token,@email,@user.name).deliver
    rescue => error
      render html: 'Cannot send password, this error has occurred : ' + error.to_s
    else
      render html: 'We have sent a new password to the email address you provided! Please, take a look...'
    end
  end
  
  def update

  end 

  private

    def user_params
      params.require(:user).permit(:name, :surname, :category, :username, :email, :password,
                                   :password_confirmation)
    end
end
