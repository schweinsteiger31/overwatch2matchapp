class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    #自分を「いいね！」してくれたユーザーの一覧
    @liking_users = current_user.liking_users
  end

  def create
    @user = User.find(params[:user_id])

    like = current_user.sent_likes.new(receiver: @user)

    if like.save
      # もし、相手(@user)も、自分(current_user)のことをすでに「いいね！」していたら...
      if @user.liked_users.include?(current_user)
        Match.create(user_one: current_user, user_two: @user)
        
        flash[:success] = "おめでとうございます！#{@user.name}さんとマッチしました！"
      end
    end
    
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    like = current_user.sent_likes.find_by(receiver: @user)
    like.destroy if like
    redirect_to user_path(@user)
  end
end