class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      log_in user
      # session[:user_id] = user.id
      remember user
      redirect_to :root
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
    forget(current_user)
    log_out if logged_in?
    redirect_to :root
  end
end