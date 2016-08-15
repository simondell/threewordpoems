class Poem < ApplicationRecord
  belongs_to :poet, optional: true
  mount_uploader :picture, PictureUploader

  scope :newest_first, -> { order created_at: :desc }

  validates :content, presence: true
  validate :picture_size


private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, 'should be less than 5 megabytes'
    end
  end
end
