# Project Background
Analytica Institute is a sample EdTech company that provides specialized data analytics courses and certifications. Digital marketing—particularly through Google Ads—plays a central role in the company’s customer acquisition strategy, driving awareness, conversions, and long-term enrollments. 

This project focuses on analyzing one major Google Ads campaign promoting the company’s courses. By cleaning, consolidating, and synthesizing this data, the analysis aims to uncover actionable insights that will improve campaign efficiency and overall business performance.

Insights and recommendations are provided on the following key areas:
- Ad Performance Analysis: Evaluation of ROAS, CTR, and CVR to determine campaign efficiency.
- Time-Based Performance: Identifying weekday and monthly patterns through CTR, CVR, and ROAS to uncover seasonality and guide budget allocation.
- Keyword & Device Trends: Understanding how different devices and keywords contribute to campaign outcomes (ROAS, CTR, CVR).

The SQL queries used to inspect and clean the data for this analysis can be found here

Targeted SQL queries regarding various business questions can be found here

An interactive Tableau dashboard can be found here

# Data Structure & Initial Checks
The dataset consists of raw, uncleaned advertising records from a Google Ads campaign with each row representing the performance of a single ad on a given date.

<img width="535" height="625" alt="a (3)" src="https://github.com/user-attachments/assets/1911039d-b3fc-410c-92c8-ac792901b250" />

Before starting the analysis, several quality checks were carried out to ensure data accuracy and build familiarity with the dataset. The SQL queries used for inspection and validation can be accessed here
# Executive Summary


# Insights Deep Dive
## Ad Performance Analysis
- Campaigns such as A2660, A2585, A3459, A1976, and A3399 consistently deliver the strongest ROAS, generating 10–11x return on ad spend. This makes them clear benchmarks for efficiency.
- Meanwhile, campaigns including A3170, A1429, A2472, A2187, and A2687 fall significantly behind, yielding just 4x return, less than half the efficiency of top performers.
<img width="1289" height="779" alt="ad rank" src="https://github.com/user-attachments/assets/f3e862c6-ea74-4e60-b90b-972b9921b8d6" />


- High-ROAS ads (dark blue) cluster around $12–$15 CPC, while low-ROAS ads (light blue) are mostly in the $5–$7 CPC range.
This reinforces the pattern that paying more per click often attracts higher-intent audiences, which leads to stronger returns.
- High-ROAS ads consistently maintain lower total spend ($180–$185) compared to low-ROAS ads, which hover around $240–$250.
This suggests that efficiency is key — strong ROAS comes from smart targeting rather than higher budgets.
- Strong ads tend to have higher CTR (larger bubbles) (around 4%), indicating better engagement and reach. Meanwhile, there're more weak ads with low CTR (1–2%), limiting traffic quality and scale.
- **Insight:** Strong ROAS is driven by efficient total spend, moderate CPC, and adequate CTR (quality traffic). Low-ROAS ads are spending more but at cheaper CPCs, likely capturing less qualified traffic that fails to convert profitably.
<img width="1287" height="638" alt="highperforming ads (2) (4)" src="https://github.com/user-attachments/assets/da11795f-b256-4ee3-aec0-bfe77f0a66db" />

## Time-Based Performance
- Overall Trend: The campaign generally performed well throughout the year, with ROAS consistently above 600%, which is a strong return.
- Peak Months: September generated the second highest ROAS (747%) while having the lowest Average Cost per Ad ($186.67).
- Underperforming Months: March had the lowest ROAS (652%). Similarly, May received poor returns (686%) despite relatively high average costs.
- Declining End-of-Year Performance: ROAS gradually declined between September and December, dropping from 747% to 657%. This could be due to the fact that potential students are more focused on holidays rather than professional development around this time of year.
- **Insight:** The campaign's monthly performance shows peak efficiency in September, while the year-end period, especially December, consistently underperforms potentially due to audience disengagement.
<img width="1214" height="608" alt="month" src="https://github.com/user-attachments/assets/0520ec74-dc3d-4ee5-958d-8053114d4dea" />


- Stable Click-Through Rate (CTR): CTR is remarkably consistent throughout the entire year, hovering between 2.8% and 3.5%. This indicates that the ad creative, copy, and targeting were consistently effective at grabbing attention and convincing users to click. 
- Volatile Conversion Rate (CVR): In contrast, CVR is unstable throughout the year. The significant dips in CVR in March, May, and December directly correspond to the lower ROAS seen in those same months on the previous chart.
- **Insight:** While CTR remains consistent throughout the year, the sharp dips in CVR in March, May, and December directly caused the lower ROAS in those months. This indicates that the campaign's biggest opportunity lies in optimizing for conversions during these specific time periods.
<img width="1164" height="608" alt="month (2)" src="https://github.com/user-attachments/assets/2d65e046-8061-41ea-916f-ae9fb20d23c1" />

- Overall, the ROAS range is narrow (688%–707%), meaning performance differences across weekdays are minimal.
- Monday has the highest CTR (3.11%) but the lowest CVR (4.43%). Yet it still achieves the second-highest ROAS (706%), indicating that while fewer clicks converted, those that did were tied to high-value purchases.
- Saturday has the lowest CTR (3.03%) and a slightly below-average CVR (4.65%). However, it still delivers the highest ROAS (707%), suggesting that ads reach a smaller but more valuable audience..
- Thursday exhibits a strong balance of both CTR and CVR (both are above average), leading to a high ROAS of 701%. It is a reliable day for a good return on investment, as it attracts a good volume of traffic that converts at a decent rate.
- **Insight:** ROAS performance varies by day: Mondays and Saturdays succeed through high-value audiences, while Thursdays benefit from a steady flow of qualified traffic. However, the ROAS difference among weekdays is quite minimal, implying that weekday choice has limited impact on returns.
<img width="1287" height="608" alt="weekday (2)" src="https://github.com/user-attachments/assets/20fb52e2-5c83-4de1-a99e-2c7400b333b7" />

## Keyword & Device Trends
- In general, ROAS across all keywords is fairly tight, ranging roughly 680%–720%.
- “data analytics course” and “data analytics training” deliver the best efficiency — combining higher ROAS (713% and 702%) with lower CPA (about $32), making them the top performers.
- Conversely, “online data analytics” has both the lowest ROAS (680%) and moderate CPA ($32.68), signaling poorer efficiency.
- **Insight:** Keywords related to “course” and “training” deliver the strongest returns (higher ROAS with lower CPA) making them the most efficient investment focus.
<img width="1289" height="608" alt="keyword" src="https://github.com/user-attachments/assets/497c91f1-1029-4236-aeac-444ee950051c" />

- “data analytics course” has the second highest CTR (3.11%) and solid CVR (4.64%) with decent impressions per ad (4470), making it a consistent performer. Additionally, it also delivers the highest ROAS, showing both engagement and profitability.
- “online data analytics” has good CTR (3.12%) and CVR (4.76%) with moderate impressions per ad (4404), indicating strong engagement. Nevertheless, it still delivers the lowest ROAS, meaning the conversions it generates bring in less revenue compared to other keywords.
- “Data analytics course” stands out as the most scalable keyword due to its balance of engagement and profitability, while “online data analytics” requires cost or targeting optimization to convert its strong engagement into stronger returns.
- 
