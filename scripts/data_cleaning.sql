/* Project: NHL Data Cleaning
   File: 01_data_cleaning.sql
   Description: Prepares raw Kaggle NHL data for analysis by fixing data types, 
                adjusting timezones, and cleaning up column naming conventions.
*/

-- 1. SCHEMA OPTIMIZATION: Convert IDs from TEXT to INTEGER
-- game.home_team and game.away_team imported as TEXT.  Changed to INT so we can JOIN with team_info 

ALTER TABLE game 
ALTER COLUMN home_team TYPE INTEGER 
USING home_team::INTEGER;

ALTER TABLE game 
ALTER COLUMN away_team TYPE INTEGER 
USING away_team::INTEGER;


-- 2. TIMEZONE CORRECTION: UTC to Local Venue Time
--  Because of UTC, some actual game days were being pushed to the next day.  We cross referenced another source to verify.
--  Once verified, we Adjusting the UTC timestamp using the venue's specific offset to ensure
-- games reflect the correct local calendar day. 

UPDATE game 
SET date_time = date_time + (venue_time_zone_offset * INTERVAL '1 hour');
