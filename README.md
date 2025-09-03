# Project Background
Analytica Institute is a sample EdTech company that provides specialized data analytics courses and certifications. Digital marketing—particularly through Google Ads—plays a central role in the company’s customer acquisition strategy, driving awareness, conversions, and long-term enrollments. 

This project focuses on analyzing one major Google Ads campaign promoting the company’s courses. By cleaning, consolidating, and synthesizing this data, the analysis aims to uncover actionable insights that will improve campaign efficiency and overall business performance.

Insights and recommendations are provided on the following key areas:
- Ad Performance Analysis: Evaluation of ROAS, CTR, and CVR to determine campaign efficiency.
- Time-Based Performance: Identifying weekday and monthly patterns through CTR, CVR, and ROAS to uncover seasonality and guide budget allocation.
- Audience & Device Trends: Understanding how different devices and keywords contribute to campaign outcomes (ROAS, CTR, CVR).

The SQL queries used to inspect and clean the data for this analysis can be found here

Targeted SQL queries regarding various business questions can be found here

An interactive Tableau dashboard can be found here

# Data Structure & Initial Checks
The dataset consists of raw, uncleaned advertising records from a Google Ads campaign with each row representing the performance of a single ad on a given date.

<img width="535" height="625" alt="a (3)" src="https://github.com/user-attachments/assets/1911039d-b3fc-410c-92c8-ac792901b250" />

Before starting the analysis, several quality checks were carried out to ensure data accuracy and build familiarity with the dataset. The SQL queries used for inspection and validation can be accessed here
# Executive Summary


# Insights Deep Dive
## Ad Performance Analysis:
- Campaigns such as A2660, A2585, A3459, A1976, and A3399 consistently deliver the strongest ROAS, generating 10–11x return on ad spend. This makes them clear benchmarks for efficiency.
- Meanwhile, campaigns including A3170, A1429, A2472, A2187, and A2687 fall significantly behind, yielding just 4x return, less than half the efficiency of top performers.
<img width="1289" height="779" alt="ad rank" src="https://github.com/user-attachments/assets/f3e862c6-ea74-4e60-b90b-972b9921b8d6" />

- High-ROAS ads (dark blue) cluster around $12–$15 CPC, while low-ROAS ads (light blue) are mostly in the $5–$7 CPC range.
This reinforces the pattern that paying more per click often attracts higher-intent audiences, which leads to stronger returns.
- High-ROAS ads consistently maintain lower total spend ($180–$185) compared to low-ROAS ads, which hover around $240–$250.
This suggests that efficiency is key — strong ROAS comes from smart targeting rather than higher budgets.
- Strong ads tend to have higher CTR (larger bubbles) (around 4%), indicating better engagement and reach. Meanwhile, there're more weak ads with low CTR (1–2%), limiting traffic quality and scale.
- **Insight:** Strong ROAS is driven by efficient total spend, moderate CPC, and adequate CTR (quality traffic). Low-ROAS ads are spending more but at cheaper CPCs, likely capturing less qualified traffic that fails to convert profitably.
<img width="1287" height="638" alt="highperforming ads (2) (2)" src="https://github.com/user-attachments/assets/51e008f9-01be-4928-b8d3-f64018ce7310" />

## Time-Based Performance:
