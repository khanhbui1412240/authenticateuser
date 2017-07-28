class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  include AuthenicateHelper

  def authenticate_user
    if (!cookies[:remember_token])
      redirect_to '/login'
    else
      token = JsonWebToken.decode(cookies[:remember_token])
      user = User.find_by(email: token[:email])
      if user && user.authenticate(token[:password])
        session[:id] = user.id
      else
        redirect_to '/login'
      end
    end
  end
end
