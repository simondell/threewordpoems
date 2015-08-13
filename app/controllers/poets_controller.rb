class PoetsController < ApplicationController
  DEFAULT_POET = Poet.first

  def show
    if params[:id].nil?
      redirect_to action: "show", id: DEFAULT_POET.id and return
    end

    @poet = Poet.find(params[:id])
    @poems = @poet.poems
    @show_list = params[ :index ].nil? || params[ :list ] == 'true'

    if params[:index].nil?
      @poem = @poems.first
      current_poem_index = 0
    else
      current_poem_index = params[:index].to_i
      @poem = @poems[ current_poem_index ]
    end

    if current_poem_index - 1 >= 0
      @prev_poem_index = current_poem_index - 1
    end

    if current_poem_index + 1 < @poems.size
      @next_poem_index = current_poem_index + 1
    end

    @search_for = @poet.name
  end


  def new
    @poet = Poet.new
  end

end
