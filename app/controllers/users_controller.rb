class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show, :update_avatar, :edit_social_links, :update_social_links]
  before_action :correct_user, only: [:update_avatar, :edit_social_links, :update_social_links]

  def show
    @heroes_by_role = @user.hero_proficiencies.group_by { |p| p.hero.role }
    
    @positive_endorsements = @user.received_endorsements.includes(:endorsement_tag).select do |endorsement|
      endorsement.endorsement_tag.positive?
    end.group_by { |e| e.endorsement_tag.name }
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params) 
      redirect_to registration_complete_path, notice: 'プロフィールを登録しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_avatar
    if @user.update(avatar_params)
      redirect_to user_path(@user), notice: 'アイコンを更新しました。'
    else
      @heroes_by_role = @user.hero_proficiencies.group_by { |p| p.hero.role }
      render 'show', status: :unprocessable_entity
    end
  end
  
  def edit_social_links
  
  end

  def update_social_links
    if @user.update(social_links_params)
      redirect_to @user, notice: "連絡先情報を更新しました。"
    else
      render :edit_social_links, status: :unprocessable_entity
    end
  end

  def registration_complete

  end

  private

  def set_user
    @user = User.with_attached_avatar.includes(
      play_model: [:play_time, :play_style, :talk_style, :tank_rank, :damage_rank, :support_rank], 
      hero_proficiencies: :hero,
      received_endorsements: :endorsement_tag
    ).find(params[:id])
  end
  
  def correct_user
    unless current_user == @user
      redirect_to root_path, alert: "権限がありません。"
    end
  end

  def user_params
    params.require(:user).permit(:name, :age, :gender, :avatar, :discord_id)
  end

  def avatar_params
    params.require(:user).permit(:avatar)
  end
  
  def social_links_params
    params.require(:user).permit(:discord_id)
  end
end

