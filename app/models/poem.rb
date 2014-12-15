class Poem < ActiveRecord::Base
	belongs_to :colourway
	has_many :poem_categories
	has_many :categories, through: :poem_categories

	scope :top_ten, -> { where top_ten: true }
end
