class PoemsController < ApplicationController
  before_action :set_poem, only: [:destroy, :show]
  before_action :logged_in_poet, only: [:destroy]

  def create
    @poem = logged_in? ?
      current_poet.poems.build( poem_params ) :
      Poem.new( poem_params )

    if @poem.save
      flash[:success] = 'Pukka pizza poetry'
      redirect_to @poem
    else
      render 'new'
    end
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

  def poem_params
    poem = params.require :poem
    poem.permit [
      :content,
      :title
    ]
  end

end
