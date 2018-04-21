class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:username] = @user.username 
  end

  def destroy
    session.delete :username 
    redirect_to '/login'
  end

end
