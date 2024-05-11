WITH classification_entries AS (
  SELECT teams.id AS team_id,
         COUNT(discovered_route_points.id) AS discovered_treasures,
         MAX(discovered_route_points.discovered_at) - MIN(discovered_route_points.discovered_at) AS treasure_hunt_time,
         MIN(discovered_route_points.discovered_at) AS first_treasure_discovered_at,
         MAX(discovered_route_points.discovered_at) AS last_treasure_discovered_at
    FROM teams
         LEFT JOIN route_points AS discovered_route_points ON teams.id = discovered_route_points.team_id AND discovered_route_points.state = 3
   GROUP BY teams.id
)
SELECT row_number() OVER (ORDER BY discovered_treasures DESC, treasure_hunt_time ASC, team_id ASC) AS place, *
FROM classification_entries;
