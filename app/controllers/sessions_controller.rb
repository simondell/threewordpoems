class SessionsController < ApplicationController
	def new
	end

	def create
		submitted_email = params[:session][:email].downcase
		submitted_password = params[:session][:password]

		@poet = Poet.find_by email: submitted_email

		if @poet && @poet.authenticate( submitted_password )
			log_in @poet
			if params[:session][:remember_me] == '1' then remember @poet else forget @poet end
			redirect_to @poet
		else
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end
