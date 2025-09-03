class PartnerConditionsController < ApplicationController
  before_action :authenticate_user! # ログイン必須
  before_action :set_partner_condition # 各アクションの前に@partner_conditionを準備

  def edit
    
  end

  def update
    if @partner_condition.update(partner_condition_params)
      redirect_to root_path, notice: '相手に求める条件を保存しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_partner_condition
    
    @partner_condition = current_user.partner_condition || current_user.build_partner_condition
  end

  def partner_condition_params
    params.require(:partner_condition).permit(
      :age_preference, :play_time_id, :play_style_id, :talk_style_id,
      # ▼▼▼▼▼ 以下の2行を追記 ▼▼▼▼▼
      role_criterions_attributes: [:id, :role, :rank_id, :condition_type, :_destroy],
      partner_condition_heroes_attributes: [:id, :hero_id, :_destroy]
    )
  end
end