class AccountActivationsController < ApplicationController
  def edit
    poet = Poet.find_by email: params[:email]
    if poet && !poet.activated? && poet.authenticated?(:activation, params[:id])
      poet.toggle! :activated
      poet.update_attribute :activated_at, Time.zone.now
      log_in poet
      flash[:success] = 'Account activated!'
      redirect_to poet
    end
  end
end
