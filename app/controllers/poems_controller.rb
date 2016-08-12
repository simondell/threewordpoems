class PoemsController < ApplicationController
  before_action :logged_in_poet, only: [:create, :destroy]

  def create
  end

  def destroy
  end
end
