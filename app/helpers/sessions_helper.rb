module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
  def signed_in?
    !current_user.nil?
  end
  def current_user=(user)
    @current_user = user
  end
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
  def sign_out
    remember_token = User.new_remember_token
    current_user.update_attribute(:remember_token, User.encrypt(remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
    $selected_account = nil
    $client = nil
  end
  def select_account(account)
    cookies.permanent[:selected_account] = account.id
    $selected_account = account
  end
  def set_client(client)
    $client = client
  end
  def account_selected?
    !$client.nil?
  end
  def account_selected
    unless account_selected?
      redirect_to accounts_url, notice: "Please select an account."
    end
  end

end
