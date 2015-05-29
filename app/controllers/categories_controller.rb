class CategoriesController < ApplicationController
	def show
		@poem = Category.first.poems.first
		render "poems/show"
	end
end
