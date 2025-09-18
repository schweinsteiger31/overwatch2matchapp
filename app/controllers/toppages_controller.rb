class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      # 自分以外の全ユーザーを取得
      other_users = User.where.not(id: current_user.id)

      #各ユーザーとの相性スコアを計算する
      @recommended_users = other_users.map do |other_user|
        score = MatchingScoreCalculator.call(current_user, other_user)
        { user: other_user, score: score }
      end

      #計算したスコアが高い順にユーザーを並べ替える
      @recommended_users.sort_by! { |u| -u[:score] }

      render :dashboard
    end
  end

  def dashboard

  end
end
