class Game < ApplicationRecord
  belongs_to :users
  validates :content, presence: true, length: {maximum: 1000}
end
