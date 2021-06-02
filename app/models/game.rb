class Game < ApplicationRecord
  belongs_to :user
  has_many :upshots, dependent: :destroy

  validates :content, presence: true, length: {maximum: 1000}
end
