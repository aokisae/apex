class UsersController < ApplicationController
  
  before_action :admin_user,     only: [:index,:destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
 
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def admin_user
      redirect_to(root_path) unless current_user.admin?
  end

end