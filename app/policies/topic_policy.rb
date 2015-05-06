class TopicPolicy < ApplicationPolicy
 
   def index?
     true
   end
 
   def create?
     user.present?
   end
 
   def update?
     create?
   end
end