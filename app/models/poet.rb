class Poet < ApplicationRecord
  attr_accessor :remember_token

  before_save { email.downcase! }

  validates :name,
    presence: true,
    length: { maximum: 1057 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,
    presence: true,
    length: { maximum: 400 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  validates :password,
    presence: true,
    length: { minimum: 6 }

  has_secure_password


  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ?
        BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost

      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = Poet.new_token
    digested_token = Poet.digest remember_token
    update_attribute :remember_digest, digested_token
  end
end
