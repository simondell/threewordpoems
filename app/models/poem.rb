class Poem < ApplicationRecord
  belongs_to :poet, optional: true
  default_scope -> { order created_at: :desc }

  validates :content, presence: true
end
