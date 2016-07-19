class PoetsController < ApplicationController
  def new
    @poet = Poet.new
  end

  def show
    @poet = Poet.find params[:id]
  end
end
