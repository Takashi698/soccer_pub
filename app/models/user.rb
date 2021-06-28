class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
  validates :name, presence: true, length: {maximum: 100}
  
  has_many :games, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :comments
  # has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_games, through: :favorites, source: :game

  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def self.guest_info
    find_or_create_by(name: 'guest_user', email: 'guest_user@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'guest_user'
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name =  'admin_guest'
      user.admin = true
    end
  end

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
end
