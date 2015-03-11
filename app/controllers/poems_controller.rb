class PoemsController < ApplicationController
	before_action :set_poem, only: [:show, :edit, :update, :destroy]
	before_action :set_poets, only: [:edit, :update]

	# GET /poems
	# GET /poems.json
	def index
		#@poems = Poem.includes( :categories ).categorise_by( params[:categorise_by] )
		top_ten_poems = Category.first.poems
		session[:collection] = []
		top_ten_poems.each {|poem| session[:collection].push poem.id}

		respond_to do |format|
			format.html { redirect_to Category.first.poems.first }
			#format.html { redirect_to @poems.first }
		end
	end

	# GET /poems/1
	# GET /poems/1.json
	def show
		@coll = session[:collection] || nil
		@current_id = params[ :id ].to_i
		@current = @coll.find_index( @current_id )

		if @current + 1 < @coll.size then @next_poem = Poem.find( @coll[ @current + 1 ] ) end
		if @current - 1 >= 0 then @prev_poem = Poem.find( @coll[ @current - 1 ] ) end
	end

	# GET /poems/new
	def new
		@poem = Poem.new
		@poets = Poet.all
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

		# Never trust parameters from the scary internet, only allow the white list through.
		def poem_params
			params.require(:poem).permit( :title, :body, :poet_id, {category_ids: []}, :image )
		end
end
