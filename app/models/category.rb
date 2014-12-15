class Category < ActiveRecord::Base
	has_many :poem_categories
	has_many :poems, through: :poem_categories
end
