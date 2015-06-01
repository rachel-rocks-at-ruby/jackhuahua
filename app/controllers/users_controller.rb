 class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
 
   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end

   def index
     @users = User.all
   end

   def show
     @user = User.friendly.find(params[:id])
     @galleries = @user.galleries
     @friendships = Friendship.where(user_id: @user.id)
     @friend = Friendship.where(user_id: @user.id).first

     @friend_if = Friendship.where(user_id: current_user.id, friend_id: @user.id).first if current_user


     @favorites = Favorite.where(user_id: @user.id)
     @topics = Topic.where(user_id: @user.id)
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :avatar, :role, :description, :location, :slug)
   end
 end