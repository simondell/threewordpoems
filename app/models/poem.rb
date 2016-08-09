class Poem < ApplicationRecord
  belongs_to :poet

  validates :poet_id, presence: true
  validates :content, presence: true
end
