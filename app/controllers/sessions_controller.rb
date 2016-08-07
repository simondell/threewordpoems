class SessionsController < ApplicationController
  def create
    @poet = Poet.find_by( email: params[:session][:email].downcase )

    if @poet && @poet.authenticate( params[:session][:password] )
      if @poet.activated?
        log_in @poet
        if params[:session][:remember_me] == '1'
          remember @poet
        else
          forget @poet
        end
        redirect_back_or poet_path @poet
      else
        flash[:warning] = 'Account not activated. Check your email for the activation link'
        redirect_to root_url
      end
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
