class PoemsController < ApplicationController
  before_action :set_poem, only: [:show]
  before_action :logged_in_poet, only: [:destroy]
  before_action :correct_poet, only: [:destroy]

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
    @poem.destroy
    flash[:success] = 'Never to return!'
    redirect_to request.referer || root_url
  end

  def new
    @poem = Poem.new
  end

  def show
    if @poem.poet.blank?
      @poem.poet = Poet.prefers_anonymity
    end
  end

private
  def correct_poet
    @poem = current_poet.poems.find_by id: params[:id]
    redirect_to root_url if @poem.nil?
  end

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
