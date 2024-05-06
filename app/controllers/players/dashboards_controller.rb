class Players::DashboardsController < ApplicationController
  def show
    @team = Team.find(cookies.signed[:my_team])
  rescue ActiveRecord::RecordNotFound
    redirect_to not_enrolled_path
  end
end
