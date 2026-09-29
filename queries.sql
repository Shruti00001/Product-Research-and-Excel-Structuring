-- name: platform_summary  (CTE + RANK window function)
WITH platform_stats AS (
    SELECT platform,
           COUNT(*)                 AS products,
           ROUND(AVG(price), 0)     AS avg_price,
           ROUND(AVG(rating), 2)    AS avg_rating,
           SUM(reviews)             AS total_reviews
    FROM products
    GROUP BY platform
)
SELECT *, RANK() OVER (ORDER BY avg_rating DESC) AS rating_rank
FROM platform_stats;

-- name: top3_per_category  (ROW_NUMBER + PARTITION BY, subquery)
SELECT category, product_name, platform, price, rating, reviews
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY category ORDER BY rating DESC, reviews DESC) AS rn
    FROM products
)
WHERE rn <= 3
ORDER BY category, rn;

-- name: price_premium_vs_category  (AVG() OVER window)
SELECT product_name, category, price,
       ROUND(AVG(price) OVER (PARTITION BY category), 0) AS category_avg_price,
       ROUND(100.0 * (price / AVG(price) OVER (PARTITION BY category) - 1), 1) AS premium_pct
FROM products
ORDER BY premium_pct DESC
LIMIT 10;

-- name: brands_above_category_avg  (correlated subquery + HAVING)
SELECT p.category, p.brand, COUNT(*) AS products, ROUND(AVG(p.rating), 2) AS brand_avg_rating
FROM products p
GROUP BY p.category, p.brand
HAVING AVG(p.rating) > (SELECT AVG(rating) FROM products WHERE category = p.category)
   AND COUNT(*) >= 3
ORDER BY p.category, brand_avg_rating DESC;

-- name: price_quartile_vs_rating  (NTILE window function)
WITH q AS (SELECT *, NTILE(4) OVER (ORDER BY price) AS price_quartile FROM products)
SELECT price_quartile, COUNT(*) AS products, ROUND(MIN(price), 0) AS min_price,
       ROUND(MAX(price), 0) AS max_price, ROUND(AVG(rating), 2) AS avg_rating
FROM q GROUP BY price_quartile ORDER BY price_quartile;
