class UsersController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params).save 
  end

  def welcome
  end

  private 

    def user_params 
      params.require(:users).permit(:username, :password, :password_confirmation)
    end 

end
