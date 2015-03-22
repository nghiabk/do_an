class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by username: params[:session][:username]
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if user.admin?
        redirect_to root_url
      else
        redirect_to user
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end