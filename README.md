# Bellabeat Case Study  

Google Data Analytics Capstone Project  

---

## Overview  
This project analyzes Fitbit fitness tracker data to generate marketing insights for **Bellabeat**, a high-tech company that manufactures health-focused smart products for women.  
The focus is on cleaning, analyzing, and visualizing **user activity and sleep data**, with supporting checks on heart rate and weight logs.  

---

## Dataset  
- **Source**: [FitBit Fitness Tracker Data (Kaggle)](https://www.kaggle.com/datasets/arashnic/fitbit)  
- **Type**: Publicly available, de-identified data from 30 users  
- **Timeframe**: March–May 2016  

---

## Tools & Technologies  
- **R** → dplyr, tidyr, ggplot2, readr (data cleaning, transformation, visualization)  
- **Excel** → manual cleaning (activity & weight logs)  
- **GitHub** → documentation and portfolio presentation  

---

## Steps in Analysis  
1. **Data Cleaning**  
   - *Sleep*: Cleaned in R (duplicates removed, missing values handled, aggregated daily records, TotalSleep calculated).  
   - *Daily Activity*: Cleaned in Excel (renamed columns, blanks removed, invalid records dropped).  
   - *Heart Rate*: Cleaned in R (timestamps standardized, aggregated to minute-level).  
   - *Weight Log*: Cleaned in Excel (duplicates removed, standardized dates, retained key fields).  

2. **Data Transformation**  
   - Standardized variable names (e.g., `Total Steps` → `TotalSteps`).  
   - Merged **daily sleep** + **daily activity** datasets by `Id` and `date`.  

3. **Data Visualization**  
   - Distribution of **total sleep per day**.  
   - Relationship: **Total Sleep vs Total Steps**.  
   - Relationship: **Sedentary Minutes vs Total Sleep**.  

4. **Insights & Recommendations**  

---

## Key Insights  
- Sleep duration varies widely; many users record less than the recommended 7–8 hours.  
- Higher sedentary minutes are often linked with **lower total sleep**.  
- No strong positive correlation between sleep and steps → activity levels are not directly tied to sleep duration.  
- **Weight and heart rate logs were sparse**, recorded by only a few users, limiting broader insights.  

---

## Recommendations for Bellabeat  
- Highlight **sleep tracking features** in marketing campaigns.  
- Add **reminder nudges** to reduce sedentary time.  
- Introduce **gamified challenges** (step streaks, consistent bedtime streaks) to increase engagement.  
- Explore **personalized insights** when more complete weight/heart rate data becomes available.  

---

## Repository Structure  
bellabeat-case-study/
│-- data/ # Raw and cleaned datasets (CSV, Excel, Zip)
│-- scripts/ # R scripts for cleaning & analysis
│-- visuals/ # Graphs (PNG files)
│-- Bellabeat Case Study Report.docx # Final report
│-- README.md # Project documentation

---

## Author  
**Somayah Alhabib**  
