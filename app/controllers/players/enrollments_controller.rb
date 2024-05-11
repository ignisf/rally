class Players::EnrollmentsController < ApplicationController
  def create
    @team = Team.find_by!(code: params[:team_code])

    cookies.signed[:my_team] = {value: @team.id, expires: 365.days.from_now, secure: true, httponly: true}

    redirect_to rules_path # , notice: "You are now part of #{@team.name}!"
  end

  def missing
  end
end
