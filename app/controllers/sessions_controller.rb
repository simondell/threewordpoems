class SessionsController < ApplicationController
  def create
    poet = Poet.find_by( email: params[:session][:email].downcase )
    if poet && poet.authenticate( params[:session][:password] )
      log_in poet
      remember poet
      redirect_to poet
    else
      flash.now[:error] = 'Do it again!!'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def new
  end
end
