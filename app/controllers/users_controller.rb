class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params).save
     if !@user.nil?
      current_user = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/signup'
    end
  end

  def welcome
    @user = current_user
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
