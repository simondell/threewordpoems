module SessionsHelper
	def log_in poet
		session[:poet_id] = poet.id
	end

	def current_poet
		poet_in_session = session[:poet_id]
		@current_poet ||= Poet.find_by id: poet_in_session
	end

	def logged_in?
		!current_poet.nil?
	end

end

