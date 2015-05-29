class GalleryPolicy < ApplicationPolicy
  def create?
    #user is logged-in AND the record belongs to current_user or admin
    user.present? && (record.user == user || user.admin?)
  end

  def new?
    create?
  end
end