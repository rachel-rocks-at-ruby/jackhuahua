class PhotosController < ApplicationController

  def create
    @photo = Photo.new(photo_params)
    @photo.save
  end

  def destroy
    @photo = Photo.find(params[:id])

    if @photo.destroy
      flash[:notice] = "Photo was deleted successfully."
      redirect_to :back
    else
      flash[:error] = "There was an error deleting the photo."
      render :show
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :gallery_id)
  end

end