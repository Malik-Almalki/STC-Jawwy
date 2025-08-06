SELECT * FROM jawwy LIMIT 5;

SELECT COUNT(*) as total_rows FROM jawwy;

SELECT
  SUM(CASE WHEN program_name IS NULL THEN 1 ELSE 0 END) AS null_program_name,
  SUM(CASE WHEN user_id_maped IS NULL THEN 1 ELSE 0 END) AS null_user_id_maped,
  SUM(CASE WHEN duration_seconds IS NULL THEN 1 ELSE 0 END) AS null_duration_seconds,
  SUM(CASE WHEN date_ IS NULL THEN 1 ELSE 0 END) AS null_date_
FROM jawwy;

SELECT
  COUNT(*) AS total_views,
  COUNT(DISTINCT user_id_maped) AS total_unique_viewers
FROM jawwy;

SELECT
  ROUND(SUM(duration_seconds) / 3600, 2) AS Total_watch_time_in_houres
FROM jawwy;

SELECT
    program_class,
    SUM(duration_seconds) / 3600 AS total_hours,
    COUNT(DISTINCT user_id_maped) AS total_unique_viewers,
    COUNT(*) AS total_views
FROM jawwy
GROUP BY program_class;

SELECT
  program_genre,
  COUNT(*) AS total_views,
  ROUND( (COUNT(*) * 100.0) / (SELECT COUNT(*) FROM jawwy), 2) AS percentage_of_total_views
FROM jawwy
GROUP BY program_genre
ORDER BY total_views DESC;

SELECT
    program_name,
    COUNT(*) AS total_views
FROM jawwy
WHERE program_class = 'MOVIE'
GROUP BY program_name
ORDER BY total_views DESC
LIMIT 5;

SELECT
    program_name,
    COUNT(*) AS total_views
FROM jawwy
WHERE TRIM(program_class) = 'SERIES/EPISODES'
GROUP BY program_name
ORDER BY total_views DESC
LIMIT 5;

SELECT
  CASE
    WHEN hd = 1 THEN 'HD'
    ELSE 'SD'
  END AS quality_type,
  COUNT(*) AS total_views,
  ROUND(SUM(duration_seconds) / 3600, 2) AS total_hours
FROM jawwy
GROUP BY hd
ORDER BY total_views DESC;
