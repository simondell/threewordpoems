class Poem < ActiveRecord::Base
	belongs_to :colourway
	scope :top_ten, -> { where top_ten: true }
end
