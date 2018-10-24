class SetcardController < ApplicationController
  
  def show
    @user = current_user
    @images = current_user.images
  end

  # def destroy
  #   @image = Image.find(params[:id])
  #   @image.destroy
  #   respond_to do |format|
  #     format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
end
