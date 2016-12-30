class Flag < ActiveRecord::Base
  belongs_to :flagged, polymorphic: true
  belongs_to :user
  validates_presence_of :user_id, :flagged_id, :flagged_type
end
