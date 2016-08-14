class Poem < ApplicationRecord
  belongs_to :poet, optional: true
  default_scope -> { order created_at: :desc }
  mount_uploader :picture, PictureUploader
  validates :content, presence: true
  validate :picture_size

private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, 'should be less than 5 megabytes'
    end
  end
end
