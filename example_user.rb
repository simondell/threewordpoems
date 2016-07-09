class User
	attr_accessor :name, :email

	def initialize attributes = {}
		@name = attributes[:name]
		@email = attributes[:email]
	end

	def alphabetical_name
		parts = @name.split(' ')
		"#{parts.last}, #{parts[0..-2].join(' ')}"
	end

	def formatted_email
		"#{@name} <#{@email}>"
	end
end