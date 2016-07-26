class PoetsController < ApplicationController
  def create
    @poet = Poet.new user_params
    if @poet.save
      redirect_to poet_url @poet
    else
      render 'new'
    end
  end

  def new
    @poet = Poet.new
  end

  def show
    @poet = Poet.find params[:id]
  end

private
  def user_params
    required = params.require :poet
    required.permit(:name, :email, :password, :password_confirmation)
  end

end
