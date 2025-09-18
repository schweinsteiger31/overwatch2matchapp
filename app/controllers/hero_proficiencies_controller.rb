class HeroProficienciesController < ApplicationController
  before_action :authenticate_user! 

  def edit
    @heroes_by_role = Hero.order(:name).group_by(&:role)

    @user = current_user

    Hero.pluck(:id).each do |hero_id|
      @user.hero_proficiencies.find_or_initialize_by(hero_id: hero_id)
    end
  end

  def update
    @user = current_user

    is_initial_setup = @user.hero_proficiencies.all?(&:new_record?)

    if @user.update(hero_proficiencies_params)
      if is_initial_setup
        #最初の登録なら完了ページへ
        redirect_to hero_proficiency_completion_path, notice: 'ヒーローの習熟度を保存しました。'
      else
        #2回目以降の更新ならダッシュボードへ
        redirect_to root_path, notice: 'ヒーローの習熟度を更新しました。'
      end
    else
      @heroes_by_role = Hero.order(:name).group_by(&:role)
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def hero_proficiencies_params
    params.require(:user).permit(hero_proficiencies_attributes: [:id, :hero_id, :proficiency_level])
  end
end
