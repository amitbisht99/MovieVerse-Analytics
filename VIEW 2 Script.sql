CREATE VIEW MovFinLang AS
SELECT
mf.movie_title, mf.industry, mf.release_year, mf.imdb_rating, 
mf.studio, mf. budget_INR_millions, mf.revenue_INR_millions, mf.budget_INR_billions, 
mf.revenue_INR_billions, mf.budget_USD_millions, mf.revenue_USD_millions, 
mf.budget_USD_billions, mf.revenue_USD_billions, l.language_list
FROM MovieFin mf
JOIN languages l
ON mf.language_id = l.language_id;

DROP VIEW MovFinLang;

SELECT * FROM MovFinLang;

