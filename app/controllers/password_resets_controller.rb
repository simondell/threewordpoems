class PasswordResetsController < ApplicationController
  def edit
  end

  def create
    email_for_reset = params[:password_reset][:email].downcase
    @poet = Poet.find_by email: email_for_reset
    if @poet
      @poet.create_reset_digest
      @poet.send_password_reset_email
      flash[:info] = 'Email sent, with password reset instructions'
      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found'
      render 'new'
    end
  end

  def new
  end
end
