class Gallery < ActiveRecord::Base
	belongs_to :user
	has_many :favorites, :as => :favorable, dependent: :destroy

	mount_uploader :image

	default_scope { order('created_at DESC') }
	#scope :visible_to, -> (user) { user ? all : joins(:dog).where('dogs.public' => true) }

    validates :title, length: { minimum: 2 }, presence: true
    validates :body, length: { minimum: 5 }, presence: true
    validates :user, presence: true
end
