class Players::SkipsController < ApplicationController
  before_action :assign_team

  def create
    @treasure_skip = @team.treasure_skips.build(skip_params.merge(skipped_at: Time.current, discovered_at: Time.current))
    @treasure_skip.save!
    redirect_to dashboard_path
  end

  private

  def skip_params
    params.require(:skip).permit(:treasure_id)
  end

  def assign_team
    @team = Team.find(cookies.signed[:my_team])
  rescue ActiveRecord::RecordNotFound
    redirect_to not_enrolled_path
  end
end
