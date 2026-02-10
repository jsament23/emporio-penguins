# Analyzing the Five Goal Free Ball Effect On Sales
Quantifying NHL Performance on Restaurant Revenue

**Technical Skills Used**
SQL: Window Functions, Joins, Date Truncation.
Tableau: Table Calculations (LOOKUP, ZN), Dual-Axis Charts, Data Normalization.
Statistics: Control vs. Treatment Groups, Normalization.


The Problem: We partnered with the Penguins to create an 'in-game' and social media trigger:

If the Penguins scored 5+ goals in a game, all fans would recieve a free meatball the following day in our downtown Pittsburgh restaurant.  To calculate it's affect on sales, we analyzed sales data from the previous season compared to the season with the Five Goal Free Ball to see what revenue and traffic effect the trigger had on sales.


**Phase 1:** NHL Frequency Analysis (SQL)
Goal: Determine how often the "Treatment" (5+ goals) actually occurred to assess feasibility.

I queried a historical NHL dataset to identify games where the Pittsburgh Penguins scored 5 or more goals, establishing the frequency of 'Treatment' events across the 16-17 season.

    **Phase 1A**: Clean the dataset for timestamp errors, duplicates, and formatting
    **Phase 1B:** Run the Query for 5 Goal Analysis

**Phase 2:** Baseline vs. Treatment Normalization (SQL)

Goal: Compare the 2015-16 season (no promotion) vs. 2016-17 (active promotion).  These datasets are synthetic to mask proprietary business information and financials.  They mimick the cadence of business transactions for the restaurant as realworld as possible.

    **Phase 2A** Create synthetic yet realistic datasets for each year to mask financials
    **Phase 2B** Run Analysis of Baseline vs Treatment focusing on: Normal Days (no games either season), Day After 5 Goal Games, and Weekends After 5 Goal Games (this is when most business transactions occurred).

To ensure a fair comparison, I aligned sales data by 'Season Week' and 'Day of Week' rather than calendar date. This ensured I was comparing a Treatment Saturday against a Baseline Saturday, eliminating weekend-skewed results.


**Phase 3:** Impact Visualization (Tableau)
Goal: Prove the lift.

The interactive dashboard visualizes the 15-16 Baseline vs. the 16-17 Treatment. Points of interest are annotated with the percentage lift, showcasing an average surge of X% following high-scoring games.  Because restaurant revenue is very dependent on the day of the week, we normalized each week so days of the week aligned.


**RESULT** Overall we found very positive effects on revenue.  
   * For the DAY AFTER a 5 goal game, there was a 36% lift in revenue and a 35% lift in covers.
   * For the WEEKEND FOLLOWING a 5 goal game, +23.67% in revenue, +14.77% in covers.
   * We felt confident that causality could be applied to the Five Goal Free Ball because non-game days had an average of +3.5% growth in revenue and even a -3.5% drop in covers.
   * A t-test confirmed that these results had a less than 5% chance of being random.  
