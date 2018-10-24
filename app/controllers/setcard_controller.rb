class SetcardController < ApplicationController
  
  def show
    @user = current_user
    @images = current_user.images
  end
end
