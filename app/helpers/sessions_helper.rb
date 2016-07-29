module SessionsHelper

  def current_poet
    @current_poet ||= Poet.find_by(id: session[:poet_id])
  end

  def log_in poet
    session[:poet_id] = poet.id
  end

  def logged_in?
    !current_poet.nil?
  end

end
