class MatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @matches = Match.where("user_one_id = ? OR user_two_id = ?", current_user.id, current_user.id).order(created_at: :desc)
  end

  def show
    @match = Match.find(params[:id])
    
    @matched_user = @match.user_one == current_user ? @match.user_two : @match.user_one
  end
end
