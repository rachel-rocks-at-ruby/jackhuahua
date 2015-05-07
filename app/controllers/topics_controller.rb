class TopicsController < ApplicationController
  def index
     @topics = Topic.paginate(page: params[:page], per_page: 10)
     authorize @topics
  end

  def new
     @topic = Topic.new
     authorize @topic
  end

  def show
     @topic = Topic.find(params[:id])
     @posts = @topic.posts.paginate(page: params[:page], per_page: 10)
     @friend_if = current_user.friendships.where(friend_id: @topic.id)
     authorize @topic
  end

  def edit
     @topic = Topic.find(params[:id])
     authorize @topic
  end
 
   def create
     @topic = current_user.topics.build(topic_params)
     authorize @topic
     if @topic.save
       redirect_to @topic, notice: "#{@topic.name} was saved successfully."
     else
       flash[:error] = "Error adding dog. Please try again."
       render :new
     end
   end
 
   def update
     @topic = Topic.find(params[:id])
     authorize @topic
     if @topic.update_attributes(topic_params)
       redirect_to @topic
     else
       flash[:error] = "Error saving dog. Please try again."
       render :edit
     end
   end

   def destroy
     @topic = Topic.find(params[:id])
 
     authorize @topic
     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to topics_path
     else
       flash[:error] = "There was an error removing the dog."
       render :show
     end
   end

   private

   def topic_params
     params.require(:topic).permit(:name, :description, :public)
   end
end
