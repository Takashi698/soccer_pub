class Team < ApplicationRecord
  has_many :upshots, dependent: :destroy
  mount_uploader :image, ImageUploader
end
