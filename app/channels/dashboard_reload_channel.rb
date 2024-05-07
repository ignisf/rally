class DashboardReloadChannel < ApplicationCable::Channel
  def subscribed
    stream_from "team_#{current_team.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
