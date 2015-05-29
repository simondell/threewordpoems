class CategoriesController < ApplicationController
	def show

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

		render "poems/show"
	end
end
