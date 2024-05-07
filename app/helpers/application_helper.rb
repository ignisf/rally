module ApplicationHelper
  def next_route_point_for(team)
    team.route_points_left_to_discover.order(position: :asc).first
  end

  def treasures_discovered(team)
    team.discovered_treasures
  end

  def treasures_left_to_find(team)
    team.treasures_left_to_discover
  end

  def game_still_on?
    Rails.application.config.deadline.future?
  end

  def game_still_on_for?(team)
    game_still_on? && treasures_left_to_find(team).count > 0
  end

  def deadline_in_words
    time_left = ActiveSupport::Duration.build(Rails.application.config.deadline - Time.current).parts

    if 1.day.from_now > Rails.application.config.deadline
      "#{time_left[:hours].to_i.to_s.rjust(2, "0")}:#{time_left[:minutes].to_i.to_s.rjust(2, "0")}"
    else
      "> 1 day"
    end
  end
end
