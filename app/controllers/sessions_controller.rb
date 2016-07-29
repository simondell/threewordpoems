class SessionsController < ApplicationController
  def create
    poet = Poet.find_by( email: params[:session][:email].downcase )
    if poet && poet.authenticate(params[:session][:password])
      # log in and redirect to Poet profile
    else
      flash.now[:error] = 'Do it again!!'
      render 'new'
    end
  end

  def destroy
  end

  def new
  end
end
