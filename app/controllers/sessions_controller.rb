
class SessionsController < ApplicationController

  def new
  end

  def create

       @user = User.find_by(name: params[:user][:name])
      if @user && @user.authenticate(params[:user][:password])
      #return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'

    else
      redirect_to '/login'
    end
  end


  def destroy
    session.delete :username
    redirect_to '/login'
  end

end
