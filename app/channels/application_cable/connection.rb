module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_team

    def connect
      self.current_team = find_team
    end

    private

    def find_team
      if (team = Team.find_by(id: cookies.signed[:my_team]))
        team
      else
        reject_unauthorized_connection
      end
    end
  end
end
