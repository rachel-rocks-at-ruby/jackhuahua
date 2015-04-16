class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic

	default_scope { order('created_at DESC') }

    validates :title, length: { minimum: 2 }, presence: true
    validates :body, length: { minimum: 5 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true
end
