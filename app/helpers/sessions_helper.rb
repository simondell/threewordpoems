module SessionsHelper

  def current_poet
    if (poet_id = session[:poet_id])
      @current_poet ||= Poet.find_by(id: poet_id)
    elsif (poet_id = cookies.signed[:poet_id])
      poet = Poet.find_by(id: poet_id)
      if poet && poet.authenticated?(:remember, cookies[:remember_token])
        log_in poet
        @current_poet = poet
      end
    end
  end

  def current_poet? poet
    poet == current_poet
  end

  def forget poet
    poet.forget
    cookies.delete :poet_id
    cookies.delete :remember_token
  end

  def log_in poet
    session[:poet_id] = poet.id
  end

  def logged_in?
    !current_poet.nil?
  end

  def log_out
    forget current_poet
    session.delete :poet_id
    @current_poet = nil
  end

  def redirect_back_or default
    redirect_to( session[:forwarding_url] || default )
    session.delete :forwarding_url
  end

  def remember poet
    poet.remember
    cookies.permanent.signed[:poet_id] = poet.id
    cookies.permanent[:remember_token] = poet.remember_token
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
