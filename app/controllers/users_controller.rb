class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    @user = User.includes(play_model: [:tank_rank, :damage_rank, :support_rank], hero_proficiencies: :hero).find(params[:id])

    @heroes_by_role = @user.hero_proficiencies.group_by { |p| p.hero.role }

    
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

  def registration_complete
  end

  
  private

  # editとupdateで共通の@userを見つける処理
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :age, :gender)
  end
end