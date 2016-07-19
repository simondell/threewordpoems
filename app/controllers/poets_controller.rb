class PoetsController < ApplicationController
  def new
  end

  def show
    @poet = Poet.find params[:id]
  end
end
