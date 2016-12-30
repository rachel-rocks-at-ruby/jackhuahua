class FlagsController < ApplicationController
  def create
    @flag = Flag.new(flag_params)
    @flag.user = current_user

    if @flag.save
      flash[:notice] = "Flagged."
      redirect_to :back
    else
      flash[:error] = "Flag failed."
      redirect_to :back
    end
  end

  def destroy
    @flag = Flag.find(params[:id])

    if @flag.destroy
      flash[:notice] = "Un-flagged."
      redirect_to :back
    else
      flash[:error] = "Failed to un-flag."
      redirect_to :back
    end
  end

  private

  def flag_params
    params.require(:flag).permit(:flagged_type, :flagged_id)
  end

end
