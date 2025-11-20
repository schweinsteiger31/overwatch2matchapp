class ToppagesController < ApplicationController
  def index
    if user_signed_in?
      other_users = User.where.not(id: current_user.id)

      scored_users = other_users.map do |other_user|
        score = MatchingScoreCalculator.call(current_user, other_user)
        { user: other_user, score: score }
      end
      
      sorted_users = scored_users.sort_by { |u| -u[:score] }

      @pagy, @recommended_users = pagy_array(sorted_users, limit: 6)

      respond_to do |format|
        format.html { render :dashboard }
        format.turbo_stream
      end
    end
  end

  def dashboard
   
  end
end

