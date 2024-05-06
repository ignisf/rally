class Players::EnrollmentsController < ApplicationController
  def create
    @team = Team.find_by!(code: params[:team_code])

    session[:my_team_id] = @team.id

    redirect_to dashboard_path # , notice: "You are now part of #{@team.name}!"
  end

  def missing
  end
end
