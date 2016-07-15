class Poet < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
    presence: true,
    length: { maximum: 1057 }

  validates :email,
    presence: true,
    length: { maximum: 400 },
    format: { with: VALID_EMAIL_REGEX }
end
