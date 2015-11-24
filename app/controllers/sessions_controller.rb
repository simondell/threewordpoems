class SessionsController < ApplicationController
  def new
  end

  def create
  	submitted_email = params[:session][:email].downcase
  	submitted_password = params[:session][:password]

  	poet = Poet.find_by email: submitted_email

  	if poet && poet.authenticate( submitted_password )
  		# do stuff
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end
end
