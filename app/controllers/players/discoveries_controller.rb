class Players::DiscoveriesController < ApplicationController
  before_action :ensure_game_is_still_on, :assign_team, :assign_treasure, :ensure_treasure_is_next

  def new
    @treasure_discovery = DiscoveryForm.new(treasure: @treasure)
  end

  def create
    @treasure_discovery = DiscoveryForm.new(discovery_form_params.merge(treasure: @treasure))

    if @treasure_discovery.valid?
      @team.route_points.find_by!(treasure: @treasure).update!(state: :discovered, discovered_at: Time.current)
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def ensure_game_is_still_on
    redirect_to root_path unless Rails.application.config.deadline.future?
  end

  def ensure_treasure_is_next
    redirect_to root_path unless @treasure == @team.next_treasure
  end

  def discovery_form_params
    params.require(:discovery_form).permit(:answer)
  end

  def assign_treasure
    @treasure = helpers.treasures_left_to_find(@team).find_by(code: params[:treasure_code])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
