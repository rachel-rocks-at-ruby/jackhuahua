class TopicsController < ApplicationController

  def index
    @topics = Topic.paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    @user = @topic.user

    @favorite = @topic.favorites.where(user_id: current_user.id).first if current_user
    @new_favorite = Favorite.new
    authorize @topic
  end

  def new
    @user = current_user
    @topic = Topic.new
    authorize @topic
  end

  def create
    @user = current_user
    @topic = current_user.topics.build(topic_params)
    authorize @topic

    if @topic.save
      flash[:notice] = "Forum topic was saved."
      redirect_to [@topic]
    else
      flash[:error] = "There was an error saving the forum topic. Please try again."
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @user = User.find(params[:id])
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.update_attributes(topic_params)
      flash[:notice] = "Forum topic was updated."
      redirect_to [@topic]
    else
      flash[:error] = "There was an error saving the forum topic. Please try again."
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to forum_path
    else
      flash[:error] = "There was an error deleting the forum topic."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :body, :user_id)
  end

end