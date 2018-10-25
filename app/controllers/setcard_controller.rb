class SetcardController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @images = @user.images
  end

  def search
    if params[:search_param].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @users = User.search(params[:search_param])
      # if user_signed_in? && current_user
        @users = current_user.except_current_user(@users)
      # end
      flash.now[:danger] = "No users match this search criteria" if @users.blank?
    end
    respond_to do |format|
      format.js { render partial: 'setcard/result' }
    end
  end

  def find_model
  end
end
