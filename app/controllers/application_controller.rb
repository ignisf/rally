class ApplicationController < ActionController::Base
  def assign_team
    @team = Team.find(cookies.signed[:my_team])
  rescue ActiveRecord::RecordNotFound
    redirect_to not_enrolled_path
  end

  helper_method :assign_team
end
