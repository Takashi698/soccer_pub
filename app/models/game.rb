class Game < ApplicationRecord
  belongs_to :users
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: {maximum: 1000}
end
