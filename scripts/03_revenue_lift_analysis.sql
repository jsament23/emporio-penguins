/* 2015-16 vs 2016-17 with the 5-goal games flagged. 
 We looked at the day after sales compared to the previous year as well as the following weekend when the majority of business transactions occured.
We aligned the same day of the week for the best comparison

*/


WITH fivegoal_games AS (
    SELECT game_date::date 
    FROM (VALUES 
        ('2016-10-29'), ('2016-11-02'), ('2016-11-05'), ('2016-11-23'), ('2016-12-01'),
        ('2016-12-03'), ('2016-12-05'), ('2016-12-08'), ('2016-12-12'), ('2016-12-20'),
        ('2016-12-27'), ('2017-01-08'), ('2017-01-16'), ('2017-01-20'), ('2017-01-22'),
        ('2017-03-03'), ('2017-03-08'), ('2017-03-17'), ('2017-04-06'), ('2017-04-16'),
        ('2017-04-20'), ('2017-04-29'), ('2017-05-21'), ('2017-05-29'), ('2017-06-08')
    ) AS dates(game_date)
),

daily_performance AS (
    SELECT 
        impact.sale_date,
        impact.daily_revenue AS rev_new,
        base.daily_revenue AS rev_old,
        impact.covers AS covers_new,
        base.covers AS covers_old,
        CASE 
            WHEN (impact.sale_date - 1) IN (SELECT game_date FROM fivegoal_games) 
                THEN 'Day After 5-Goal'
            WHEN impact.day_of_week IN ('Friday', 'Saturday') 
                 AND EXISTS (SELECT 1 FROM fivegoal_games gn WHERE gn.game_date BETWEEN impact.sale_date - 6 AND impact.sale_date)
                THEN '5-Goal Weekend'
            ELSE 'Normal Day'
        END AS impact_type
    FROM emporio_sales_1617 impact
    -- Aligning to the same day of the week in the previous year for comparison purposes.
    JOIN emporio_sales_1516 base ON base.sale_date = (impact.sale_date - INTERVAL '364 days')
)

SELECT 
    impact_type,
    ROUND(AVG(rev_old), 2) AS avg_rev_1516,
    ROUND(AVG(rev_new), 2) AS avg_rev_1617,
    ROUND((AVG(rev_new) - AVG(rev_old)) / NULLIF(AVG(rev_old), 0) * 100, 2) AS revenue_lift_pct,
    ROUND(AVG(covers_old), 0) AS avg_covers_1516,
    ROUND(AVG(covers_new), 0) AS avg_covers_1617,
    ROUND((AVG(covers_new) - AVG(covers_old)) / NULLIF(AVG(covers_old), 0) * 100, 2) AS cover_lift_pct
FROM daily_performance
GROUP BY 1
ORDER BY revenue_lift_pct DESC;
