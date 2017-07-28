class AuthenicateController < ApplicationController
  def new

  end
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      log_in user
      remember_user params[:user][:email],params[:user][:password]
      redirect_to root_path
    else
      render 'new'
    end
  end
  def delete
    log_out
    redirect_to root_path
  end

end
