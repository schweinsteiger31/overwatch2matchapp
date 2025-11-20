class HeroProficienciesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]
  
  def edit
    @heroes_by_role = Hero.order(:name).group_by(&:role)
    
    Hero.pluck(:id).each do |hero_id|
      proficiency = @user.hero_proficiencies.find_or_initialize_by(hero_id: hero_id)
      if proficiency.new_record?
        proficiency.proficiency_level = :unable_to_play
      end
    end
  end

  def update
    is_initial_setup = @user.hero_proficiencies.all?(&:new_record?)
    
    if @user.update(hero_proficiencies_params)
      
      if is_initial_setup
        redirect_to hero_proficiency_completion_path, notice: 'ヒーローの習熟度を保存しました。'
      else
        redirect_to user_path(@user), notice: 'ヒーローの習熟度を更新しました。'
      end
    else
      @heroes_by_role = Hero.order(:name).group_by(&:role)
      render :edit, status: :unprocessable_entity
    end
  end

  def completion
    
  end

  private
  
  def set_user
    @user = current_user
  end

  def hero_proficiencies_params
    params.require(:user).permit(hero_proficiencies_attributes: [:id, :hero_id, :proficiency_level])
  end
end

