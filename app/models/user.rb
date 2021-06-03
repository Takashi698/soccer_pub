class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :games, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :name, presence: true, length: {maximum: 100}
  mount_uploader :image, ImageUploader

  def self.guest_info
    find_or_create_by(name: 'guest_user', email: 'guest_user@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
