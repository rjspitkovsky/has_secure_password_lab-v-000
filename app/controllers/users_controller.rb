class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params).save
    redirect_to '/welcome'
  end

  def welcome
    @user = current_user
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
