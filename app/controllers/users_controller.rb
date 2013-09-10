class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new user_parameters
  	if @user.save
  		redirect_to products_url, :notice => "Signed up!"
  	else
  		render "new"
  	end
  end

  private
  def user_parameters
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end