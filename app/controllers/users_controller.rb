class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def edit
    
    # @user = current_user
  end

  def update
    # @user = current_user
    if @user.update(user_params) 
      redirect_to registration_complete_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def registration_completed
  end

  
  private

  # editとupdateで共通の@userを見つける処理
  def set_user
    @user = current_user
  end

  # updateアクションで使う、安全なパラメータを受け取るメソッド
  def user_params
    params.require(:user).permit(:name, :age, :gender)
  end
end