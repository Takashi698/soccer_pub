class Game < ApplicationRecord
  belongs_to :user

  has_one :upshot, dependent: :destroy
  accepts_nested_attributes_for :upshot, allow_destroy: true
  
  has_many :comments, dependent: :destroy
  # has_many :teams, dependent: :destroy

  validates :content, presence: true, length: {maximum: 1000}
  validates :place, presence: true
  validates :match_at, presence: true

  def self.new_and_build
    game = Game.new
    game.build_upshot
    return game
  end

  def team_a
    self.upshot.team_a if self.upshot
  end

  def team_b
    self.upshot.team_b if self.upshot
  end

  def team_a?
    self.upshot.present? && self.upshot.team_a.present?
  end

  def team_b?
    self.upshot.present? && self.upshot.team_b.present?
  end
end
