class Poet < ActiveRecord::Base
	has_many :poems

	validates :name,
		presence: true

	validates :email,
		presence: true,
		length: { maximum: 255 }
end
