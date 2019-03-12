class StreaksController < ApplicationController
  def create
    streak = Streak.new(streak_params.merge(streak_started_at: Time.now))
    streak.save
    redirect_to root_path
  end

  def update
    streak = Streak.find(params[:id])
    streak.update(streak_started_at: Time.now)
    redirect_to root_path
  end

  private def streak_params
    params.require(:streak).permit(:name, :streak_started_at)
  end
end
