class Players::DashboardsController < ApplicationController
  def show
    @team = Team.find(session[:my_team_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to not_enrolled_path
  end
end
