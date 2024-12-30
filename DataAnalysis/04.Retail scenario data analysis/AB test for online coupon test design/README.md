Record my work of data analysis ,data warehouse ,data visualization ,data lineage and data related algorithms
# My-data-analysis-project
## Data-analysis

### Key Points of AB Testing: Target KPI and Strategy
- 04.Retail scenario data analysis
  - AB test for online coupon test design

### A good coupon design should be able to answer the following questions:
- Which has a better effect, taking effect on the same day or the next day?
- What is the difference in effect between covering weekends and not covering weekends?
- Do different preferential mechanisms for the same product have different effects?
- Will extremely deep discounts (free) hurt costs?
- What kind of coupon is most suitable for driving traffic (transaction volume)?
- What kind of coupon is most suitable for increasing revenue (transaction value)?
- What kind of coupon is most suitable for boosting profit?

#### Part 1 Business Objectives
- Boosting Transaction Volume: Coupons with the highest per capita TC effect.
- Driving Sales: Coupons with the highest per capita sales effect.
- Maximizing Profit: Coupons with the highest per capita profit effect.

#### Part 2 Coupon Test Design
- Multiple coupon designs are similar.
  - This similarity is manifested in: similar products; similar discount intensities; similar discount methods.
  - Strategy: Adopt equal distribution among multiple test groups, for example, four groups of coupons, each accounting for 20%, and the control group accounting for 20%.
- There is high uncertainty in coupon design.
  - Under what circumstances is the uncertainty high: based on brand new products; historically lowest discount intensity; brand new discount methods.
  - Strategy: Minimize the test group, for example, 10% for testing and 90% for control.
- High confidence in coupons, only for tracking effects.
  - What kind of coupons have high confidence: coupons that have been repeatedly verified as effective in history; products and discount intensities are conservative and will not touch business red lines.
  - Strategy: Maximize the test group, for example, 90% for testing and 10% for control.

#### Part 3 Coupon Test Key Points
- Whether it takes effect: on the same day, the next day.
- Validity period: 3 days, 4 days, 5 days, etc.
- Whether it covers weekends: covered, not covered.
- Discount intensity: 50% off, 70% off, free giveaway, etc.
- Discount methods: buy one get one free, direct discount, free upgrade, etc.
- Discounted products

#### Part 4 Selecting Active Members within the Last 12 Months of the Brand
- Divide members into 27 groups by the last digit of the membership number.
- Calculate the number of people in each group. If it is not enough, expand the active time period.
- Ensure that the number of people in each group is as equal as possible, and the smallest group should not be less than 310,000 people.

#### Example:
Company Coupon Test Data.xlsx


#### Here is the interpretation of this summary data:
#### I. Data Overview
- This data set contains data of multiple promotional activities, and each activity has a unique Activity ID and corresponding Activity description.
- The data covers different dates, including weekdays (Weekday) and weekends (Weekend), which can be used to analyze the effects of promotional activities at different time periods.

#### II. Data Field Analysis
Control Number of People: Its specific meaning is not clear. It may be a reference or benchmark number of people, or the number of people in the control group.
- Activity ID: Used to uniquely identify each promotional activity, facilitating data management and analysis.
- Activated: Indicates whether the activity has been activated. t + 1 may mean the first day after the activity starts, and t + 0 may mean the day the activity starts.
- Activity: A detailed description of the promotional activity, stating the specific preferential content, such as discounts, buy one get one free, free tasting, or free upgrades.
- Date: The date of the activity, in forms like 1.9 - 1.12 or 1.8 - 1.14, which is the start and end date of the activity or other relevant date ranges.
- Day: Distinguishes whether the activity is on a weekday or weekend, which can be used to compare the different effects of promotional activities on weekdays and weekends.
- Coupon Issuance Base: It seems to be the basic number of coupons issued at the beginning of an activity. For each activity, this value is mostly 319,918, representing the base number of coupons issued at the start of the activity.
- Test Group TC: Represents the number of transactions in the test group. The number of transactions in the test group varies for different activities, reflecting different levels of activity participation.
- Coupon-Used TC: The number of transactions completed using coupons. Through this data, one can see how many users have consumed using coupons.
- I.TC Absolute Value: Its specific calculation logic is not clear, but from the data, it is an absolute value related to the number of transactions, possibly related to the difference between the expected number of transactions or other reference indicators, and this value can be positive or negative.
- I.tc.abs Simple Correction: A correction of I.TC Absolute Value, presented in percentage form, reflecting the adjustment of this indicator.
- FreeRider Simple Correction: Related to the deviation between the expected and actual effects of promotional activities.
- I.sales.abs Simple Correction: A correction of the absolute value of sales data, related to the difference between expected and actual sales data, presented in percentage form.
- I.tc Simple Correction: A correction of the number of transactions, adjusted considering various factors.
- I.sales Simple Correction: A correction of sales data, reflecting the adjusted sales situation, with different values for different activities.
- I.ta Simple Correction: Different activities have different correction results.
- tc/dapan Simple Correction: A correction for comparing the number of transactions with the market (overall market or larger range of data).
- sales/dapan Simple Correction: A correction for comparing sales data with the market, reflecting the sales situation of the activity in the overall market.
- total var. cost%: The percentage change in total cost, which can help analyze the impact of the activity on costs.
- Profit Impact: The impact on profit, showing the impact of each activity on profit, which can be used to evaluate whether the activity is profitable or contributes to profit.
- is_test: Identifies whether the record is from the test group or the control group. For example, control represents the control group, and test represents the test group, used for comparing experimental effects.
- Coupon Issuance Base: It may be the basic number of coupons issued at the start of the activity, and the values for different activities are mostly between around 319,000 and 500,000, which may represent different resource inputs for different activities.
- tc: The number of transactions, representing the number of completed transactions in the corresponding group (test group or control group), and the tc values vary for different activities and groups, reflecting the participation level of the activity.
- sales: The sales amount, which may be the total sales generated within the group, and its size is affected by factors such as activity types and participation levels.
- Market tc: Represents the number of transactions in a larger range (the market), which can be used to compare the transaction situation of the activity with the overall market situation, and the data of different activities may come from the same market data.
- Market sales: Represents the total sales in a larger range (the market) and serves as a reference, which can be used to evaluate the sales performance of the activity in the entire market.
- tc.per: The proportion of transactions, which is the ratio of tc to Market tc, reflecting the contribution of the activity to the overall market transactions and helping to analyze the activity's contribution to overall transactions.
- tc.liftup: The percentage increase in the number of transactions, which is the percentage increase in the number of transactions in the test group compared with the control group. A positive value indicates an increase, and a negative value indicates a decrease, which can be used to evaluate the activity's effect on promoting transactions.
- sales.per: The proportion of sales, which is the ratio of sales to Market sales, used to evaluate the activity's share in the overall market sales.
- sales.liftup: The percentage increase in sales, which is the percentage increase in sales in the test group compared with the control group, used to evaluate the activity's impact on sales.
- ta: It may be the total amount or other composite indicators, and based on the context, it may be a total indicator related to the value generated by the activity.
- ta.liftup: The percentage increase in the total amount or composite indicators, similar to sales.liftup, used to evaluate the activity's impact on this composite indicator.
- Coupon-Used ta: The total amount generated by using coupons, which is the total value of transactions completed using coupons and can be used to analyze the effect of coupon usage.
- Pre-activity tc: The number of transactions before the activity, which is the benchmark number of transactions before the activity starts and can be used as a reference for evaluating the impact of the activity on transactions.
- Pre-activity sales: The sales amount before the activity, which can be used as a reference for evaluating the impact of the activity on sales before the activity.
- Pre-activity tc_per_liftup: The increase in the proportion of transactions before the activity, which may be the increase in the proportion of tc before the activity, and can be used to analyze the trend before the activity.
- Pre-activity sales_per_liftup: The increase in the proportion of sales before the activity, which can be used to analyze the sales trend before the activity.
- Pre-activity ta: The total amount or composite indicator before the activity, which can be used as a reference indicator for the pre-activity.

#### III. Data Insights
- Differences in Performance of Different Activities
  - By comparing data of different Activity IDs, one can see significant differences in the effects of different promotional activities. For example, for some activities like ABC432201712 conducted on weekends, its I.sales Simple Correction reaches 9.72%, while for some activities like ABC440201712, the I.sales Simple Correction is only -0.58%.
  - Different types of promotional activities (such as buy one get one free, discounts, free tasting, free upgrades, etc.) show different performances in various indicators, and further analysis may be needed to determine which promotional methods are more attractive to users and can increase the number of transactions and profits.
  
- Comparison between Weekdays and Weekends
   - From the Day field, one can see that there are differences in the test group TC, coupon-used TC, various correction indicators, and profit impacts between weekend and weekday activities. For example, comparing two similar children's package activities, ABC449201712 (weekend) and ABC448201712 (weekday), differences can be observed in the test group TC and other indicators, which helps analyze consumers' consumption behaviors and responses to promotional activities at different times.

- Profit Analysis
Through Profit Impact, one can quickly determine whether each activity has a positive impact on profit. Some activities have a positive Profit Impact, indicating a contribution to profit, while some are negative, and the cost and revenue structure of the activity may need to be re-evaluated.

- Increase Proportion Indicators
  - tc.liftup and sales.liftup are key indicators for evaluating the effect of an activity. By observing these indicators, one can directly understand whether the activity promotes the growth of transaction numbers and sales.
  - For example, in the test group of ABC437201712, tc.liftup is 10% and sales.liftup is 13%, indicating that the activity has a good effect on promoting transactions and sales; while in the test group of ABC440201712, tc.liftup and sales.liftup are close to 0%, indicating that the activity's promoting effect is not obvious.

- Correction Indicators
  - Correction indicators such as I.tc Simple Correction, I.sales Simple Correction, tc.abs Simple Correction, and sales.abs Simple Correction may be adjustments to the original data, which can be used to more accurately evaluate the activity effect by removing some interference factors or deviations.
  - For example, I.tc Simple Correction of some activities is positive, such as 13.3% in the test group of ABC435201712, while some are negative, such as -4.2% in the test group of ABC443201712, which may reflect the real effect of the activity after considering various factors.  

