class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:edit, :update,:confilm,:withdraw]

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
    current_user.update(is_deleted: true)
    reset_session
    redierct_to root_path
  end

  private

  def update_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def authorize_user
    user = User.find(params[:id])
    unless user = current_user
      redirect_to user_path(current_user)
    end
  end
end
