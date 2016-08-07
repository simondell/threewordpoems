class AccountActivationsController < ApplicationController
  def edit
    poet = Poet.find_by email: params[:email]
    if poet && !poet.activated? && poet.authenticated?(:activation, params[:id])
      poet.activate
      log_in poet
      flash[:success] = 'Account activated!'
      redirect_to poet
    else
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end
end
