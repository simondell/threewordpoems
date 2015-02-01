class Poem < ActiveRecord::Base
	# relationships
	belongs_to :colourway
	belongs_to :poet
	has_many :poem_categories
	has_many :categories, through: :poem_categories


	# extras
	mount_uploader :image, PoemImageUploader # adds image uploading


	# scope :top_ten, -> { where top_ten: true }
	scope :categorise_by, -> ( category_name ) { joins( :categories ).where( 'categories.name = ?', category_name ) if category_name.present? }
end
