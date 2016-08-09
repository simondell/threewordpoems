class Poem < ApplicationRecord
  belongs_to :poet
  default_scope -> { order created_at: :desc }

  validates :poet_id, presence: true
  validates :content, presence: true
end
