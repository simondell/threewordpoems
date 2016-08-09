class Poet < ApplicationRecord
  has_many :poems, dependent: :destroy
  attr_accessor :remember_token, :activation_token, :reset_token

  before_create :create_activation_digest
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
    length: { minimum: 6 },
    allow_nil: true

  has_secure_password

  def activate
    update_columns activated: true, activated_at: Time.zone.now
  end

  def authenticated? action, token
    digest = send("#{action}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def create_reset_digest
    self.reset_token = Poet.new_token
    digested_token = Poet.digest reset_token
    update_columns reset_digest: digested_token, reset_sent_at: Time.zone.now
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def remember
    self.remember_token = Poet.new_token
    digested_token = Poet.digest remember_token
    update_attribute :remember_digest, digested_token
  end

  def send_activation_email
    PoetMailer.account_activation(self).deliver_now
  end

  def send_password_reset_email
    PoetMailer.password_reset(self).deliver_now
  end

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


private
  def create_activation_digest
    self.activation_token = Poet.new_token
    self.activation_digest = Poet.digest activation_token
  end
end
