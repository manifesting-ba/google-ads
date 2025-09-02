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

- High CPC
<img width="1287" height="638" alt="highperforming ads (2)" src="https://github.com/user-attachments/assets/d423b577-3321-4de4-b5e5-3b8e14dd267a" />
