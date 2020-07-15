class UsersController < ApplicationController
  layout false
  skip_before_action :verify_authenticity_token
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
  
  def update

  end 

  private

    def user_params
      params.require(:user).permit(:name, :surname, :category, :username, :email, :password,
                                   :password_confirmation)
    end
end
