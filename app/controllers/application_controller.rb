class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper


private
  def logged_in_poet
    unless logged_in?
      store_location
      flash[:error] = 'Please log in'
      redirect_to login_url
    end
  end

end
