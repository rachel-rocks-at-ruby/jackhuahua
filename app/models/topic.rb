class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, :as => :favorable, dependent: :destroy

  validates :title, length: { minimum: 2 }, presence: true
  validates :body, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
