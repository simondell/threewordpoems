class PoetsController < ApplicationController
  before_action :set_poet, only: [:show, :edit, :update]
  before_action :logged_in_poet, only: [:destroy, :edit, :index, :update]
  before_action :correct_poet, only: [:edit, :update]
  before_action :editor_privilege, only: :destroy

  def create
    @poet = Poet.new user_params
    if @poet.save
      @poet.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url
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
    activated_poets = Poet.where activated: true
    @poets = activated_poets.paginate page: params[:page]
  end

  def new
    @poet = Poet.new
  end

  def show
    redirect_to root_url and return unless @poet.activated?
    @poems = @poet.poems.lacigolonorhc.paginate page: params[:page]
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
