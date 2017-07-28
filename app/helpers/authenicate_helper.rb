module AuthenicateHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember_user(email,password)
    token = {email: email,password: password}
    cookies[:remember_token] = JsonWebToken.encode(token)
  end

  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end

  def logged_in?
   !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    current_user = nil
    cookies.delete :remember_token
  end
end
