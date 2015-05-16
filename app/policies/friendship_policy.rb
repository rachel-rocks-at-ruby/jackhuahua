class FriendshipPolicy < ApplicationPolicy
  def create?
    user.present? && (record.user == user || user.admin?)
  end
end