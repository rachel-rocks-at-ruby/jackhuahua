 class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:show]
 
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
     @user = User.find(params[:id])
     @posts = @user.posts.visible_to(current_user)
     @friends = Friendship.where(user_id: @user.id)
     @friend = Friendship.where(user_id: @user.id).first
     @friend_if = Friendship.where(user_id: current_user.id).first
   end
 
   private
 
   def user_params
     params.require(:user).permit(:name, :avatar)
   end
 end