class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    matched_user_ids = Match.where("user_one_id = ? OR user_two_id = ?", current_user.id, current_user.id)
                             .pluck(:user_one_id, :user_two_id).flatten.uniq - [current_user.id]

    @liking_users = current_user.liking_users.where.not(id: matched_user_ids)
  end

  def sent
    @liked_users = current_user.liked_users
    Rails.logger.info "=== liked_users === #{ @liked_users.pluck(:id, :name) }"
  end

  def create
    @user = User.find(params[:user_id])
    like = current_user.sent_likes.new(receiver: @user)

    if like.save
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

