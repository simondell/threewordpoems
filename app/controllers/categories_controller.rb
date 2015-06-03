class CategoriesController < ApplicationController
	DEFAULT_CATEGORY = Category.first

	def show
		set_category_or_default() or return

		@poems = Category.first.poems
		@poem = @poems.first

		current_poem_index = @poems.find_index @poem

		unless @poems == nil
			if current_poem_index + 1 < @poems.size
				@next_poem = @poems[ current_poem_index + 1 ]
			end

			if current_poem_index - 1 >= 0
				@prev_poem = @poems[ current_poem_index - 1 ]
			end
		end # unless

		@search_for = Category.first.name
		render "poems/show"
	end

private
	def set_category_or_default
		if params[:id].nil? || params[:id] == ""
			redirect_to action: "show", id: DEFAULT_CATEGORY.id
			return
		end
		@category = Category.find(params[:id])
	end
end
