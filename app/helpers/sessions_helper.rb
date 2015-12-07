module SessionsHelper
	def log_in poet
		session[:poet_id] = poet.id
	end

	def remember poet
		poet.remember
		cookies.permanent.signed[:poet_id] = poet.id
		cookies.permanent[:remember_token] = poet.remember_token
	end

	def forget poet
		poet.forget
		cookies.delete :poet_id
		cookies.delete :remember_token
	end

	def current_poet
		# poet_in_session = session[:poet_id]
		# @current_poet ||= Poet.find_by id: poet_in_session

    if (poet_id = session[:poet_id])
      @current_poet ||= Poet.find_by(id: poet_id)
    elsif (poet_id = cookies.signed[:poet_id])
      poet = Poet.find_by(id: poet_id)
      if poet && poet.authenticated?(cookies[:remember_token])
        log_in poet
        @current_poet = poet
      end
    end
	end

	def logged_in?
		!current_poet.nil?
	end

	def log_out
		forget current_poet
		session.delete :poet_id
		@current_poet = nil
	end
end

