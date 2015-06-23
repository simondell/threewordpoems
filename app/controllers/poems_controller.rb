class PoemsController < ApplicationController
	before_action :set_poem, only: [:show, :edit, :update, :destroy]
	before_action :set_search_for, only: [:show, :index]

	# GET /poems
	# GET /poems.json
	def index
		# @poems = Poem.includes( :categories ).categorise_by( params[:categorise_by] )

		# If we get to the index/search results page without a search term, redirect
		#  to categories.first
		redirect_to categories_url and return if @search_for.nil?

		@poems = Poem.search( params[:search_for] )
		@poem = @poems.first

		# cache for later
		session[:search_for] = @search_for
		session[:index] = 0
	end

	# GET /poems/1
	# GET /poems/1.json
	def show
		@poems = Poem.search( session[:search_for] )
		current_poem_index = @poems.find_index @poem

		# unless @poems.nil?
		# 	if current_poem_index + 1 < @poems.size
		# 		@next_poem = @poems[ current_poem_index + 1 ]
		# 	end

		# 	if current_poem_index - 1 >= 0
		# 		@prev_poem = @poems[ current_poem_index - 1 ]
		# 	end
		# end # unless
	end

	# GET /poems/new
	def new
		@poem = Poem.new
	end

	# GET /poems/1/edit
	def edit
	end

	# POST /poems
	# POST /poems.json
	def create
		@poem = Poem.new(poem_params)
		@poem.poet = Poet.first

		respond_to do |format|
			if @poem.save
				format.html { redirect_to @poem, notice: 'Your poem was saved.' }
				format.json { render :show, status: :created, location: @poem }
				format.js
			else
				format.html { render :new }
				format.json { render json: @poem.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /poems/1
	# PATCH/PUT /poems/1.json
	def update
		respond_to do |format|
			if @poem.update(poem_params)
				format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
				format.json { render :show, status: :ok, location: @poem }
			else
				format.html { render :edit }
				format.json { render json: @poem.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /poems/1
	# DELETE /poems/1.json
	def destroy
		@poem.destroy
		respond_to do |format|
			format.html { redirect_to poems_url, notice: 'Poem was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_poem
			@poem = Poem.find(params[:id])
		end

		def set_search_for
			@search_for = params[:search_for] || session[:search_for] || nil
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def poem_params
			params.require(:poem).permit(
				:title,
				:body,
				:poet_id,
				{category_ids: []},
				:image,
				:maximised
			)
		end
end
