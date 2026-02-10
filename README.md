# emporio-penguins
Analyzing the Five Goal Free Ball Effect On Sales
Quantifying NHL Performance on Restaurant Revenue

The Problem: We partnered with the Penguins to create an 'in-game' and social media trigger:

If the Penguins scored 5+ goals in a game, all fans would recieve a free meatball the following day in our downtown Pittsburgh restaurant.  To calculate it's affect on sales, we analyzed sales data from the previous season compared to the season with the Five Goal Free Ball to see what revenue and traffic effect the trigger had on sales.


Phase 1: NHL Frequency Analysis (SQL)
Goal: Determine how often the "Treatment" (5+ goals) actually occurred to assess feasibility.
I queried a historical NHL dataset to identify games where the Pittsburgh Penguins scored 5 or more goals, establishing the frequency of 'Treatment' events across the 16-17 season.

Phase 2: Baseline vs. Treatment Normalization (SQL)
Goal: Compare the 2015-16 season (no promotion) vs. 2016-17 (active promotion).

To ensure a fair comparison, I aligned sales data by 'Season Week' and 'Day of Week' rather than calendar date. This ensured I was comparing a Treatment Saturday against a Baseline Saturday, eliminating weekend-skewed results.

Phase 3: Impact Visualization (Tableau)
Goal: Prove the lift.

The interactive dashboard visualizes the 15-16 Baseline vs. the 16-17 Treatment. Points of interest are annotated with the percentage lift, showcasing an average surge of X% following high-scoring games.  Because restaurant revenue is very dependent on the day of the week, we normalized each week so days of the week aligned.
