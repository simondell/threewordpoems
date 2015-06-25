class CategoriesController < ApplicationController
	DEFAULT_CATEGORY = Category.first

	def show
		if params[:id].nil?
			redirect_to action: "show", id: DEFAULT_CATEGORY.id and return
		end

		@category = Category.find(params[:id])
		@poems = @category.poems

		# find a way to modularise this to share between poems, poets, categories
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

		@search_for = @category.name
	end

end
