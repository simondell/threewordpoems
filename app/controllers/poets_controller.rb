class PoetsController < ApplicationController
  before_action :logged_in_poet, only: [:edit, :index, :update]
  before_action :correct_poet, only: [:edit, :update]

  def create
    @poet = Poet.new user_params
    if @poet.save
      log_in @poet
      flash[:success] = "Welcome to the gang, #{@poet.name}"
      redirect_to poet_url @poet
    else
      render 'new'
    end
  end

  def edit
    @poet = Poet.find params[:id]
  end

  def index
    @poets = Poet.paginate page: params[:page]
  end

  def new
    @poet = Poet.new
  end

  def show
    @poet = Poet.find params[:id]
  end

  def update
    @poet = Poet.find params[:id]

    if @poet.update_attributes user_params
      flash[:success] = 'Profile updated'
      redirect_to @poet
    else
      render 'edit'
    end
  end


private
  def correct_poet
    @poet = Poet.find params[:id]
    redirect_to(root_url) unless current_poet? @poet
  end

  def logged_in_poet
    unless logged_in?
      store_location
      flash[:error] = 'Please log in'
      redirect_to login_url
    end
  end

  def user_params
    required = params.require :poet
    required.permit(:name, :email, :password, :password_confirmation)
  end
end
