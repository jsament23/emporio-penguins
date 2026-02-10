/* Project: NHL Game Data Cleaning & Analysis
   Description: This query retrieves 5 goal games for for the Pittsburgh Penguins (ID: 5).
I used this Kaggle dataset: https://www.kaggle.com/datasets/martinellis/nhl-game-data/data

Clean up included: Modifing date_times from UTC to correct timezone (updated entire table before query)
                   Altering game.home_team and game.away_team to INT from TEXT, 
                   Removing duplicate game_ids (A game for the Pens and opponent would show twice; once for each team)
*/

WITH FiveGoalGames AS (
    -- Select only (1) game_id
    SELECT DISTINCT ON (g.game_id)
        g.game_id,
        g.date_time,
        g.season,
        g.home_goals,
        g.away_goals,
        t.team_name AS opponent
    FROM game g
    JOIN game_teams_stats gts ON g.game_id = gts.game_id
    JOIN team_info t ON (
        -- Join to find the name of the OTHER team
        (g.home_team = t.team_id AND g.home_team != 5) OR 
        (g.away_team = t.team_id AND g.away_team != 5)
    )
    WHERE (g.home_team = 5 AND g.home_goals >= 5) 
       OR (g.away_team = 5 AND g.away_goals >= 5)
)


SELECT * FROM FiveGoalGames
WHERE season = 20152016
ORDER BY date_time;
