class PlayModelsController < ApplicationController
  before_action :authenticate_user! # ログイン必須
  before_action :set_play_model, only: [:edit, :update]

  def new
    @play_model = current_user.build_play_model
  end

  def create
    @play_model = current_user.build_play_model(play_model_params)
    if @play_model.save
      redirect_to play_model_completion_path, notice: 'プロフィール情報を保存しました！'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # before_actionで@play_modelがセットされます
  end

  def update
    if @play_model.update(play_model_params)
      redirect_to root_path, notice: 'プレイ情報を更新しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def completion
    # 完了ページを表示するアクション
  end

  private # これより下は、このコントローラーの内部だけで使うメソッドです

  def set_play_model
    # editとupdateで使う、既存のPlayModelを探す
    @play_model = current_user.play_model
  end

  def play_model_params
    # フォームから送られてくる、すべてのパラメータを許可します
    params.require(:play_model).permit(
      :play_time_id,
      :play_style_id,
      :talk_style_id,
      :tank_rank_id,
      :damage_rank_id,
      :support_rank_id,
      hero_ids: []
    )
  end
end
