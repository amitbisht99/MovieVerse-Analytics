--SELECT * FROM MovFinLang;

-- 1. ROI
SELECT
movie_title "Movie",
CAST((revenue_USD_millions - budget_USD_millions) / budget_USD_millions * 100 AS DECIMAL(10,2)) "Percent ROI"
FROM MovFinLang
ORDER BY [Percent ROI] DESC;

-- 2. Average IMDB Ratings
SELECT 
CAST (AVG (imdb_rating) AS DECIMAL (10, 2)) "AVG Ratings" 
FROM MovFinLang;

-- 3. Movie counts grouped by industries, languages, and years
SELECT
    DISTINCT (industry),
    language_list "languages", 
    release_year "release years",
    COUNT(movie_title) "Movie Count"
FROM 
    MovFinLang
GROUP BY 
    industry, 
    language_list, 
    release_year
ORDER BY [Movie Count] DESC;

-- 4. Total revenue and budget by industry.
SELECT
industry, CAST (SUM(budget_INR_millions) AS DECIMAL (10, 2)) "Budget (₹ Mln)"
FROM MovFinLang
GROUP BY industry;

-- 5. Average IMDb rating per industry.
SELECT
industry,CAST (AVG (imdb_rating) AS DECIMAL (10, 2)) "Avg Ratings"
FROM MovFinLang
GROUP BY industry;

-- 6. Movie count per language.
SELECT
    language_list AS "Languages",
    COUNT(movie_title) AS "Movies"
FROM
    MovFinLang
GROUP BY
    language_list;

-- 7. Average budget & revenue per language.
SELECT
language_list "Language",
CAST (AVG (budget_INR_millions) AS DECIMAL (10, 2)) "Avg Budget (₹ Mln)",
CAST (AVG (revenue_INR_millions) AS DECIMAL (10, 2)) "Avg Revenue (₹ Mln)"
FROM MovFinLang
GROUP BY language_list;

-- 8. Total revenue and average IMDb ratings for each studio.
SELECT 
studio "Studio",
CAST (SUM (revenue_INR_millions) AS DECIMAL (10, 2)) "Total Revenue (₹ Mln)",
CAST (SUM (revenue_USD_millions) AS DECIMAL (10, 2)) "Total Revenue ($ Mln)",
CAST (AVG (imdb_rating) AS DECIMAL (10, 2)) "Avg Ratings"
FROM MovFinLang
GROUP BY studio;

-- 9. Number of movies produced by each studio.
SELECT
studio "Studio",
COUNT (movie_title) "Movies"
FROM MovFinLang
GROUP BY studio;
