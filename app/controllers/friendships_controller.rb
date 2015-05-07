class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Successfully followed user."
      redirect_to :back
    else
      flash[:notice] = "Failed to save."
      redirect_to :back
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
      flash[:notice] = "Unfollowed user."
      redirect_to :back
  end
end
