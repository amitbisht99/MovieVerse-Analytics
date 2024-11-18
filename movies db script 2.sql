-- SELECT * FROM MovFinLang;

-- 1. Top Performing Movies
--     a. Movies with the highest IMDb ratings.
SELECT TOP (5)
movie_title "Movie",
MAX (imdb_rating) "Ratings"
FROM MovFinLang
GROUP  BY movie_title
ORDER BY [Ratings] DESC;

--     b. Movies with the highest revenue.
SELECT TOP (1)
movie_title "Movies",
CAST (MAX (revenue_INR_millions) AS DECIMAL (10, 2)) "Revenue (INR Mln)",
CAST (MAX (revenue_USD_millions) AS DECIMAL (10, 2)) "Revenue (USD Mln)"
FROM MovFinLang
GROUP BY movie_title
ORDER BY [Revenue (INR Mln)] DESC;

--     c. Movies with the highest ROI (Return on Investment).
SELECT TOP (1)
movie_title "Movie",
CAST((revenue_USD_millions - budget_USD_millions) / budget_USD_millions * 100 AS DECIMAL(10,2)) "Percent ROI"
FROM MovFinLang
ORDER BY [Percent ROI] DESC;

-- 2. Industry Analysis
--     a. Comparison of industries (e.g., Bollywood, Hollywood) in terms of total revenue and average IMDb ratings.
SELECT
    industry AS "Industry",
    CAST (SUM(revenue_INR_millions) AS DECIMAL (10, 2)) "Total Revenue (INR)",
    CAST (AVG(imdb_rating) AS DECIMAL (10, 2)) "Average Rating"
FROM MovFinLang
GROUP BY industry;

--     b. Industries producing the highest number of movies.
SELECT
industry "Industry",
COUNT (movie_title) "No. of Movies"
FROM MovFinLang
GROUP BY industry;

--     c. Industry-specific trends in budget and ROI.
SELECT
    industry "Industry",
    release_year "Release Year",
    CAST (AVG(budget_USD_millions) AS DECIMAL (10, 2)) "Avg Budget ($ Mln)",
    CAST (AVG((revenue_USD_millions - budget_USD_millions) / budget_USD_millions * 100) AS DECIMAL (10, 2)) "Avg ROI ($ Mln)",
    COUNT(*) "No. of Movies"
FROM MovFinLang
GROUP BY industry, release_year;

-- 3. Language-Based Analysis
--     a. Popular languages based on the number of movies made.
SELECT
DISTINCT (language_list) "Languages",
COUNT (movie_title) "No. of Movies"
FROM MovFinLang
GROUP BY language_list
ORDER BY [No. of Movies] DESC;

--     b. Average IMDb rating for movies in each language.
SELECT
DISTINCT (language_list) "Languages",
CAST (AVG(imdb_rating) AS DECIMAL (10, 2)) "Average Rating"
FROM MovFinLang
GROUP BY language_list
ORDER BY [Average Rating] DESC;

--     c. Revenue and budget comparison of movies across languages.
SELECT
DISTINCT (language_list) "Languages",
CAST (AVG(budget_USD_millions) AS DECIMAL (10, 2)) "Avg Budget ($ Mln)",
CAST (AVG(revenue_USD_millions) AS DECIMAL (10, 2)) "Avg Revenue ($ Mln)"
FROM MovFinLang
GROUP BY language_list;

-- 4. Studio Performance
--     a.Top studios producing the highest-grossing movies.
SELECT TOP (5)
studio "Studio",
CAST (SUM(revenue_USD_billions) AS DECIMAL (10, 2)) "Revenue ($ Bln)"
FROM MovFinLang
GROUP BY studio
ORDER BY [Revenue ($ Bln)] DESC;

--     b. Studios with the highest average IMDb ratings.
SELECT TOP (5)
studio "Studio",
CAST (AVG(imdb_rating) AS DECIMAL (10, 2)) "Ratings"
FROM MovFinLang
GROUP BY studio
ORDER BY [Ratings] DESC;

-- 5. Financial Analysis
--    a. Average and median budgets and revenues across all movies.
--    b. Conversion of budgets and revenues into INR and USD for global analysis.
SELECT
    movie_title AS "Movies",
    CAST(budget_INR_millions AS DECIMAL(10,2)) AS "Budget INR (Mln)",
    CAST(revenue_INR_millions AS DECIMAL(10,2)) AS "Revenue INR (Mln)",
    CAST(budget_INR_billions AS DECIMAL(10,2)) AS "Budget INR (Bln)",
    CAST(revenue_INR_billions AS DECIMAL(10,2)) AS "Revenue INR (Bln)",
    CAST(budget_USD_millions AS DECIMAL(10,2)) AS "Budget USD (Mln)",
    CAST(revenue_USD_millions AS DECIMAL(10,2)) AS "Revenue USD (Mln)",
    CAST(budget_USD_billions AS DECIMAL(10,2)) AS "Budget USD (Bln)",
    CAST(revenue_USD_billions AS DECIMAL(10,2)) AS "Revenue USD (Bln)"
FROM
    MovFinLang
ORDER BY
    "Budget INR (Mln)" DESC, "Revenue INR (Mln)" DESC, "Budget INR (Bln)" DESC, "Revenue INR (Bln)" DESC, 
    "Budget USD (Mln)" DESC, "Revenue USD (Mln)" DESC, "Budget USD (Bln)" DESC, "Revenue USD (Bln)" DESC;

--    c. Correlation between budget and revenue or budget and IMDb ratings.

-- 6. Time-Based Analysis
--    a. Trend of budgets, revenues, and IMDb ratings over the years.
SELECT
    release_year "Years",
    CAST(SUM(budget_INR_millions) AS DECIMAL(10,2)) "Total Budget INR (Mln)",
    CAST(SUM(revenue_INR_millions) AS DECIMAL(10,2)) "Total Revenue INR (Mln)",
    CAST(AVG(imdb_rating) AS DECIMAL(10,2)) AS "Average Rating"
FROM MovFinLang
GROUP BY release_year;
-- ORDER BY [Total Budget INR (Mln)], [Total Revenue INR (Mln)], [Average Rating]; --optional

--    b. Identification of the best year for the movie industry based on total revenue.
SELECT
release_year "Years",
CAST(SUM(revenue_INR_millions) AS DECIMAL(10,2)) "Total Revenue INR (Mln)"
FROM MovFinLang
GROUP BY release_year
ORDER BY [Total Revenue INR (Mln)] DESC;
