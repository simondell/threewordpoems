class Poem < ActiveRecord::Base
	# relationships
	belongs_to :colourway
	belongs_to :poet
	has_many :poem_categories
	has_many :categories, through: :poem_categories

	# enums
	enum workflow_step: [ :unsaved, :submitted, :published, :edited ]

	# extras
	mount_uploader :image, PoemImageUploader # adds image uploading

	# scopes
	scope :categorise_by, -> ( category_name ) { joins( :categories ).where( 'categories.name = ?', category_name ) if category_name.present? }
end
