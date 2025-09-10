# Project Background
Analytica Institute is a sample EdTech company that provides specialized data analytics courses and certifications. Digital marketing—particularly through Google Ads—plays a central role in the company’s customer acquisition strategy, driving awareness, conversions, and long-term enrollments. 

This project focuses on analyzing one major Google Ads campaign promoting the company’s courses. By cleaning, consolidating, and synthesizing this data, the analysis aims to uncover actionable insights that will **enhance marketing strategy** and **drive sustainable growth**.

Insights and recommendations are provided on the following key areas:
- Ad Performance Analysis: Evaluation of ROAS, Ad Cost, CPC, and CTR to identify the drivers of high- and low-performing ads.
- Time-Based Performance: Identifying weekday and monthly patterns through CTR, CVR, Average Cost per Ad and ROAS to uncover seasonality.
- Keyword Effectiveness: Assessment of ROAS, CPA, CTR, CVR, and Average Impressions per Ad to determine the efficiency and scalability of individual keywords.
- Device Trends: Analysis of ROAS, CPA, CTR, and CVR across devices to discover the strengths of each device.

The SQL queries used to inspect and clean the data for this analysis can be found here

Targeted SQL queries regarding various business questions can be found here

An interactive Tableau dashboard can be found here

# Data Structure & Initial Checks
The dataset consists of raw, uncleaned advertising records from a Google Ads campaign with each row representing the performance of a single ad on a given date.

<img width="535" height="625" alt="a" src="https://github.com/user-attachments/assets/44dbc41b-93e2-4b6c-b02f-e53c8b7a462c" />

Before starting the analysis, several quality checks were carried out to ensure data accuracy and build familiarity with the dataset. The SQL queries used for inspection and validation can be accessed here
# Executive Summary
## Overview of Findings
From this analysis, three main insights stand out. First, **“data analytics course” is the most scalable and profitable keyword**, while alternatives like “online data analytics” and “analytics for data” underperform despite engagement. Second, **high ROAS is driven by quality traffic and efficient spend**, not simply by lowering CPC, meaning **targeting and creative matter** more than chasing cheap clicks. Finally, **timing shapes performance**, with September as the strongest month and the end-of-year period consistently underperforming, while weekday variation is minimal but Mondays, Thursdays, and Saturdays offer specific opportunities.

<img width="1302" height="799" alt="Tableau de bord 1 (3)" src="https://github.com/user-attachments/assets/693d9ff7-471e-4c83-83b6-36427312da71" />

# Insights Deep Dive
## Ad Performance Analysis
- Campaigns such as A2660, A2585, A3459, A1976, and A3399 **deliver the strongest ROAS**, **generating 10–11x return on ad spend**. This makes them clear benchmarks for efficiency.
- Meanwhile, campaigns including A3170, A1429, A2472, A2187, and A2687 fall significantly behind, yielding just **4x return**, **less than half** the efficiency of top performers.
<img width="1289" height="779" alt="ad rank" src="https://github.com/user-attachments/assets/f3e862c6-ea74-4e60-b90b-972b9921b8d6" />


- High-ROAS ads (dark blue) cluster around $12–$15 CPC, while low-ROAS ads (light blue) are mostly in the $5–$7 CPC range. This reinforces the pattern that **paying more per click often attracts higher-intent audiences**, which may lead to stronger returns.
- High-ROAS ads consistently maintain lower total spend ($180–$185) compared to low-ROAS ads, which hover around $240–$250. This suggests that efficiency is key — **strong ROAS comes from smart targeting** rather than higher budgets.
- High-ROAS ads tend to have higher CTR (larger bubbles) (around 4%), indicating **better engagement and reach**. Meanwhile, there're more weak ads with low CTR (1–2%), limiting traffic quality and scale.
- **Insight:** Strong ROAS is driven by **efficient total spend, moderate CPC, and adequate CTR (quality traffic)**. Low-ROAS ads are spending more but at cheaper CPCs, likely capturing less qualified traffic that fails to convert profitably.
<img width="1287" height="638" alt="highperforming ads (2) (4)" src="https://github.com/user-attachments/assets/da11795f-b256-4ee3-aec0-bfe77f0a66db" />

## Time-Based Performance
- **Overall Trend:** The campaign **generally performed well** throughout the year, with ROAS consistently above 600%, which is a **strong return**.
- **Peak Month:** September generated the second highest ROAS (747%) while having the lowest Average Cost per Ad ($186.67).
- **Underperforming Months:** March had the lowest ROAS (652%). Similarly, May received poor returns (686%) despite relatively high average costs.
- **Declining End-of-Year Performance:** ROAS gradually declined between September and December, dropping from 747% to 657%. This could be due to the fact that potential students are **more focused on holidays** rather than professional development around this time of year.
- **Insight:** The campaign's monthly performance shows **peak efficiency in September**, while the **year-end period**, especially December, consistently **underperforms** potentially due to audience disengagement.
<img width="1214" height="608" alt="month" src="https://github.com/user-attachments/assets/0520ec74-dc3d-4ee5-958d-8053114d4dea" />


- **Stable Click-Through Rate (CTR):** CTR is remarkably consistent throughout the entire year, hovering between 2.8% and 3.5%. This indicates that the ad creative, copy, and targeting were consistently effective at grabbing attention and convincing users to click. 
- **Volatile Conversion Rate (CVR):** In contrast, CVR is unstable throughout the year. The **significant dips in CVR in March, May, and December directly correspond to the lower ROAS** seen in those same months on the previous chart.
- **Insight:** While **CTR remains consistent** throughout the year, the **sharp dips in CVR in March, May, and December** directly caused the lower ROAS in those months. This indicates that the campaign's biggest opportunity lies in **optimizing for conversions** during these specific time periods.
<img width="1164" height="608" alt="month (2)" src="https://github.com/user-attachments/assets/2d65e046-8061-41ea-916f-ae9fb20d23c1" />

- Overall, the **ROAS range is narrow** (688%–707%), meaning performance differences across weekdays are minimal.
- **Monday** has the highest CTR (3.11%) but the lowest CVR (4.43%). Yet it still achieves the second-highest ROAS (706%), indicating that while fewer clicks converted, those that did were tied to **high-value purchases**.
- **Saturday** has the lowest CTR (3.03%) and a slightly below-average CVR (4.65%). However, it still delivers the highest ROAS (707%), suggesting that ads reach a smaller but more **valuable audience**.
- **Thursday** exhibits a strong balance of both CTR and CVR (both are above average), leading to a high ROAS of 701%. It is a reliable day for a **good return** on ad spend, as it **attracts a good volume of traffic that converts at a decent rate**.
- **Insight:** ROAS performance **varies by day**: Mondays and Saturdays succeed through high-value audiences, while Thursdays benefit from a steady flow of qualified traffic. However, the **difference** among weekdays is quite **minimal**, implying that **weekday choice has limited impact on returns**.
<img width="1287" height="608" alt="weekday (2)" src="https://github.com/user-attachments/assets/20fb52e2-5c83-4de1-a99e-2c7400b333b7" />

## Keyword Effectiveness
- In general, **ROAS** across all keywords is **fairly tight**, ranging roughly 680%–720%.
- **“data analytics course” and “data analytics training”** deliver the **best efficiency** — combining higher ROAS (713% and 702%) with lower CPA (about $32), making them the top performers.
- Conversely, **“online data analytics”** has both the lowest ROAS (680%) and moderate CPA ($32.68), signaling **poorer efficiency**.
- **Insight:** Keywords related to “course” and “training” deliver the **strongest returns** (higher ROAS with lower CPA), making them the **most efficient investment focus**. However, the **ROAS difference** is relatively **marginal**.
<img width="1289" height="608" alt="keyword" src="https://github.com/user-attachments/assets/497c91f1-1029-4236-aeac-444ee950051c" />

- **“data analytics course”** has the second-highest CTR (3.11%) and solid CVR (4.64%) with decent impressions per ad (4,470), making it a consistent performer. Additionally, it also delivers the highest ROAS, showing both **engagement and profitability**.
- **“online data analytics”** has good CTR (3.12%) and CVR (4.76%) with moderate impressions per ad (4,404), indicating **strong engagement**. Nevertheless, it still delivers the lowest ROAS, meaning the conversions it generates bring in **less revenue** compared to other keywords.
- **“analytics for data”** records the highest average impressions (4,546) but **underperforms on both CTR** (3%) **and CVR** (4.61%), leading to a second-lowest ROAS (692%).
- **Insight:** **“data analytics course”** stands out as the **most scalable keyword** due to its balance of engagement and profitability, while **“online data analytics”** and **“analytics for data”** underperform by **failing to turn its high engagement and visibility into strong returns**.
<img width="969" height="489" alt="keyword (3) (2)" src="https://github.com/user-attachments/assets/2ff0d342-bba2-4848-a0b6-0ae48c33788d" />

## Device Trends
- **Desktop** not only has the highest ROAS (700%) and lowest CPA ($32.60) but also converts best (4.77%), making it the **most profitable and efficient** device.
- **Mobile**, while slightly less efficient in ROAS & CPA, achieves the highest CTR (3.08%) and solid CVR (4.7%), proving its role as a **high-engagement** channel.
- However, performance **differences are minimal** overall, meaning no device truly outshines or underperforms.
- **Insight:** Although **desktop stands out for efficiency** and **mobile for engagement**, the **performance gap** across devices is **not highly significant**.
<img width="939" height="469" alt="device" src="https://github.com/user-attachments/assets/8d7c2921-b6d2-4022-8fcb-e22f62e2d88a" />
<img width="939" height="408" alt="device 2" src="https://github.com/user-attachments/assets/ae778bb2-cbd3-42ac-a1f2-ea6b867ef514" />

# Recommendations
Based on the insights and findings above, we would recommend the Marketing Team to consider the following:
- **Prioritize placements** and **audiences that drive high-intent traffic**, even at higher CPCs, instead of focusing only on cheap clicks. 
- **Improve creatives and ad copy** for **low-ROAS ads (A3170, A2128, A1299, A1429)** to lift CTR, while monitoring CVR to ensure new traffic maintains conversion quality.
- **Capitalize on September’s peak efficiency.** **Allocate more budget** and **scale campaigns during September** when audience responsiveness and profitability are equally strong. Also, **deep dive into this month**. Based on that, we can **set up A/B tests** to systematically test variables like ad copy, landing pages, and call-to-actions to see if we can replicate the high ROAS in other months.
- The decline in ROAS in Q4 (especially December) suggests that the existing campaign strategy may not be optimized for the **holiday season**. A **new approach for this period** might be necessary to better compete and maintain profitability.
- Optimize for conversions in weak months. Focus on **improving landing page UX, offers, or remarketing strategies in March, May, and December** where CVR dips drive low ROAS.
- While **weekday choice** has **minimal impact overall**, **Mondays and Saturdays** can be prioritized for **premium campaigns** since they show slightly higher returns thanks to high-value audience. **Thursdays** are well-suited for **standard campaign launches** given its strong balance of both CTR and CVR.
- **Scale campaigns around “data analytics course”**. Increase bids and expand variations (e.g., “best data analytics course,” “professional data analytics course”) to capture more qualified traffic, while developing tailored landing pages to capitalize on its strong engagement and profitablity.
- **Re-evaluate “online data analytics” for cost efficiency**. Since CTR and CVR are strong but ROAS is lowest, investigate whether high CPCs or low-value conversions are driving poor returns.
- **Reposition or downscale “analytics for data”**. Despite highest average impressions, its weak CTR and CVR show that users aren’t compelled to click or convert. Thus, either **refine targeting and ad copy** to improve conversion efficiency or **reallocate spend** to higher-performing terms.
- Use **mobile** to drive **discovery and engagement**, and **desktop** to drive **conversions**:
  - **Promote higher-value offerings** (bundles, advanced courses, premium packages) on **desktops** since users here show stronger conversion intent.
  - **Optimize landing pages for speed and simplicity**, testing shorter ad copy, and adding “save for later” or remarketing hooks to convert **mobile** browsers into desktop buyers.
  - **Ensure a seamless cross-device journey**. Mobile clickers should easily continue on desktop (e.g., via email remarketing, retargeting, or logged-in user flows).

# Assumptions and Caveats
- **Synthetic dataset:** This project is based on a synthetic dataset designed to simulate realistic campaign performance. While the trends and insights are valid for analysis practice, they may not fully reflect actual market behavior.
- **Time trends:** Seasonal effects (end-of-year audience fatigue) are assumed based on observed patterns but not directly verified by external market factors.
- **Close differences:** In some metrics such as weekday ROAS, keyword CTR, device ROAS, device CTR, the differences between groups are minimal, so conclusions should be interpreted cautiously.
