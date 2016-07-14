class Poet < ApplicationRecord
  validates :name,
    presence: true,
    length: { maximum: 1057 }

  validates :email,
    presence: true,
    length: { maximum: 400 }
end
