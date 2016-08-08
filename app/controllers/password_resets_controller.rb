class PasswordResetsController < ApplicationController
  before_action :set_poet, only: [:edit, :update]
  before_action :valid_poet, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

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

  def update
    if params[:poet][:password].empty?
      @poet.errors.add :password, "can't be empty"
      render 'edit'
    elsif @poet.update_attributes poet_params
      log_in @poet
      flash[:success] = 'Password has been reset.'
      redirect_to @poet
    else
      render 'edit'
    end
  end


private
  def check_expiration
    if @poet.password_reset_expired?
      flash[:danger] = 'Password reset has expired'
      redirect_to new_password_reset_url
    end
  end

  def poet_params
    required = params.require :poet
    required.permit [
      :password,
      :password_confirmation
    ]
  end

  def set_poet
    @poet = Poet.find_by email: params[:email]
  end

  def valid_poet
    unless( @poet &&
    @poet.activated? &&
    @poet.authenticated?(:reset, params[:id]) )
      redirect_to root_url
    end
  end
end
