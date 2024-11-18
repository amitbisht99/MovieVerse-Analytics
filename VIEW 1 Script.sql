CREATE VIEW MovieFin AS
SELECT
m.movie_id, m.movie_title, m.industry, m.release_year, m.imdb_rating, 
m.studio, m.language_id, 
f. budget_INR_millions, f.revenue_INR_millions, f.budget_INR_billions, 
f.revenue_INR_billions, f.budget_USD_millions, f.revenue_USD_millions, 
f.budget_USD_billions, f.revenue_USD_billions
FROM movies m
JOIN financials f
ON m.movie_id = f.movie_id;

SELECT * FROM MovieFin;
