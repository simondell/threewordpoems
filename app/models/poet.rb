class Poet < ActiveRecord::Base
	attr_accessor :remember_token

	before_save { email.downcase! }

	has_many :poems

	validates :name,
		presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@([a-z\d\-]+\.)+[a-z]+\z/i
	validates :email,
		presence: true,
		length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	validates :password,
		presence: true,
		length: { minimum: 6 }

	# TODO what about password_confirmation?

	has_secure_password

	# Returns the hash digest of the given string.
	def self.digest string
		cost = ActiveModel::SecurePassword.min_cost ?
			BCrypt::Engine::MIN_COST :
			BCrypt::Engine.cost

		BCrypt::Password.create string, cost: cost
	end

	def self.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = Poet.new_token
		digested_token = Poet.digest self.remember_token

		update_attribute :remember_digest, digested_token
	end

	def forget
		update_attribute :remember_digest, nil
	end

	def authenticated? remember_token
		return false if remember_digest.nil?

		digest = BCrypt::Password.new remember_digest

		digest.is_password? remember_token
	end
end
