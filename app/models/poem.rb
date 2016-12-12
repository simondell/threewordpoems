class Poem < ApplicationRecord
  belongs_to :poet, optional: true
  mount_uploader :picture, PictureUploader

  scope :lacigolonorhc, -> { order created_at: :desc }
  scope :unpublished, -> { where publish: false }
  scope :published, -> { where publish: true }
  scope :unmoderated, -> { where moderated: false }
  scope :moderated, -> { where moderated: true }

  validates :content, presence: true
  validate :picture_size


private
  def picture_size
    if picture.size > 5.megabytes
      errors.add :picture, 'should be less than 5 megabytes'
    end
  end
end
