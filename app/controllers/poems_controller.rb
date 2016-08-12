class PoemsController < ApplicationController
  before_action :logged_in_poet, only: [:destroy]

  def new
    @poem = Poem.new
  end

  def create
  end

  def destroy
  end
end
