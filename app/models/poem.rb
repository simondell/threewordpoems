class Poem < ActiveRecord::Base
	belongs_to :colourway
	has_many :poem_categories
	has_many :categories, through: :poem_categories

	# scope :top_ten, -> { where top_ten: true }
	scope :categorise_by, -> ( category_name ) { joins( :categories ).where( 'categories.name = ?', category_name ) if category_name.present? }
end
