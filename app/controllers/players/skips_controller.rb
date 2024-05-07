class Players::SkipsController < ApplicationController
  before_action :assign_team

  def create
    @route_point = @team.route_points.find_by!(treasure_id: skip_params[:treasure_id])
    @route_point.update!(state: :skipped)

    ActionCable.server.broadcast("team_#{@team.id}", {reload: "new_skip"})
    redirect_to dashboard_path
  end

  private

  def skip_params
    params.require(:skip).permit(:treasure_id)
  end
end
