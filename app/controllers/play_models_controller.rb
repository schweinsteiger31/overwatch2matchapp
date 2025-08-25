class PlayModelsController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # redirect_to ではなく render を使う
      flash[:notice] = "ユーザー情報が更新されました！"
      redirect_to play_models_edit_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :gender)
  end
end
