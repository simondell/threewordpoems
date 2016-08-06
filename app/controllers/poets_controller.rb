class PoetsController < ApplicationController
  before_action :set_poet, only: [:show, :edit, :update]
  before_action :logged_in_poet, only: [:destroy, :edit, :index, :update]
  before_action :correct_poet, only: [:edit, :update]
  before_action :editor_privilege, only: :destroy

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

  def destroy
    victim = Poet.find params[:id]
    victim.destroy
    flash[:success] = 'Poet culled'
    redirect_to poets_url
  end

  def edit
  end

  def index
    @poets = Poet.paginate page: params[:page]
  end

  def new
    @poet = Poet.new
  end

  def show
  end

  def update
    if @poet.update_attributes user_params
      flash[:success] = 'Profile updated'
      redirect_to @poet
    else
      render 'edit'
    end
  end


private
  def correct_poet
    redirect_to root_url unless current_poet? @poet
  end

  def editor_privilege
    redirect_to root_url unless current_poet.editor?
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
    required.permit [
      :name,
      :email,
      :password,
      :password_confirmation
    ]
  end

  def set_poet
    @poet = Poet.find params[:id]
  end
end
