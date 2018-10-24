class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader

  # under mount uploader
  validate :picture_size
  validates :picture, presence: true
  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
