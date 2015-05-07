class Favorite < ActiveRecord::Base	
  belongs_to :favorable, :polymorphic => true
  belongs_to :user
  validates_presence_of :user_id, :favorable_id, :favorable_type
end
