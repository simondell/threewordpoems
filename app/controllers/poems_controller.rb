class PoemsController < ApplicationController
  before_action :set_poem, only: [:destroy, :show]
  before_action :logged_in_poet, only: [:destroy]

  def create
  end

  def destroy
  end

  def new
    @poem = Poem.new
  end

  def show
  end

private
  def set_poem
    @poem = Poem.find params[:id]
  end
end
