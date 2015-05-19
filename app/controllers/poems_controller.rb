class PoemsController < ApplicationController
	before_action :set_poem, only: [:show, :edit, :update, :destroy]
	before_action :set_poets, only: [:edit, :update]
	before_action :set_search_for, only: [:index, :show]

	# GET /poems
	# GET /poems.json
	def index
		# @poems = Poem.includes( :categories ).categorise_by( params[:categorise_by] )
		@poems = Poem.search( params[:search_for] ) unless @search_for.nil?

		# cache for later
		session[:search_for] = @search_for
	end

	# GET /poems/1
	# GET /poems/1.json
	def show

		# @current_id = params[ :id ].to_i
		# @coll = session[ :collection ] || nil

		# unless @coll == nil
		# 	@current = @coll.find_index( @current_id ) || nil

		# 	if @current + 1 < @coll.size
		# 		@next_poem = Poem.find( @coll[ @current + 1 ] )
		# 	end

		# 	if @current - 1 >= 0
		# 		@prev_poem = Poem.find( @coll[ @current - 1 ] )
		# 	end
		# end # unless
	end

	# GET /poems/new
	def new
		@poem = Poem.new
		@poets = Poet.all
		session[:collection] = nil
	end

	# GET /poems/1/edit
	def edit
	end

	# POST /poems
	# POST /poems.json
	def create
		@poem = Poem.new(poem_params)

		respond_to do |format|
			if @poem.save
				format.html { redirect_to @poem, notice: 'Poem was successfully created.' }
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

		def set_poets
			@poets = Poet.all
		end

		def set_search_for
			@search_for = params[:search_for]
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
