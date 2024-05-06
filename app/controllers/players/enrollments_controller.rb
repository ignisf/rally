class Players::EnrollmentsController < ApplicationController
  def create
    @team = Team.find_by!(code: params[:team_code])

    cookies.signed[:my_team] = {value: @team.id, expires: 365.days}

    redirect_to root_path # , notice: "You are now part of #{@team.name}!"
  end

  def missing
  end
end
