module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end

  #def sign_in(user)
   # visit signin_path
    #fill_in "Email",    with: user.email
    #fill_in "Password", with: user.password
    #click_button "Sign in"
    # Sign in when not using Capybara as well.
    #cookies[:remember_token] = user.remember_token
  #end
end