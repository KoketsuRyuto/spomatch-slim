class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(update_params)
    redirect_to user_path(@user)
  end

  def confilm
    
  end

  def withdraw
    
  end

  private

  def update_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
