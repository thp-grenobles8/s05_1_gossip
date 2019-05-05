class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user
    else
      flash[:warning_login] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def show
    @private_message = PrivateMessage.find(params[:id])
  end

  def destroy
    session.clear
    redirect_to :root
  end
end