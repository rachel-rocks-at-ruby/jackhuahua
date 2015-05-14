class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :galleries, dependent: :destroy
  has_many :dogs
  has_many :friendships, dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :favorites, dependent: :destroy

  mount_uploader :avatar, AvatarUploader

  def admin?
   role == 'admin'
  end
 
  def moderator?
   role == 'moderator'
  end
end
