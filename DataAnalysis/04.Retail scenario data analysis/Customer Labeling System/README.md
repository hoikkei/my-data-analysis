Record my work of data analysis ,data warehouse ,data visualization ,data lineage and data related algorithms
# My-data-analysis-project
## Data-analysis
###### Data Assets Abundance: Batch Data Deduction
###### Strategy & Effect Evaluation: AB Testing, Strategic Consulting
###### Member Lifecycle Management: Member Tags, Churn Prediction Models, Cluster Analysis

- 04.Retail scenario data analysis
  - offline catering industry -Deduce the number of diners through batch data
  - AB test for online coupon test design
    - How to get the minimum sample size
  - CustomerGroup Kmeans
  - Membership Churn Model- lifetimes
  - Customer Labeling System


  # Shopping Mall Customer Labeling System

These SQL codes mainly implement a shopping mall customer labeling system, which is divided into the following main parts:

## 1. Clustering Labels (First File)
- Utilizes clustering algorithms to divide customers into different groups.
- Calculates the distance of each customer to each cluster center.
- Assigns customers to the nearest cluster group.

## 2. Lifetimes Model Labels (Second File)
- Calculates metrics for each member, such as:
  - **Purchase frequency (frequency)**: The number of times a customer made a purchase.
  - **Time elapsed since the last purchase (recency)**: How recently a customer made a purchase.
- Uses the **BG/NBD model** to calculate the survival probability of customers.
- Labels customers as **"alive" (active)** or **"dead" (churn)** based on the survival probability.

## 3. Real-time Attribute Labels (Third File)
- Creates activity labels based on the most recent access time.
- Includes activity status within the following periods:
  - Most recent 1 month.
  - Most recent 3 months.
  - Most recent 6 months.
  - Most recent 12 months.

## 4. Statistical Labels (Fourth File)
- Creates labels across various statistical dimensions:
  - **Age group labels**: Teenagers / young adults / middle-aged adults, etc.
  - **Income labels**: High income / average income.
  - **Consumption level labels**: High consumption / average consumption / low consumption.
  - **Visit frequency labels**: High frequency / medium frequency / low frequency.
  - **Preference labels**:
    - Time period preferences: Morning / noon / evening.
    - Weekday or weekend preferences.
    - Companion preferences: With children / in a relationship.
    - Consumption category preferences: Fashion / catering / entertainment / parent-child.
  - **Customer history labels**: New customers / old customers.

## 5. Label Aggregation and Application (Fifth File)
- Integrates all labels into one comprehensive table.
- Provides several example queries for label applications:
  - Find high-income and low-consumption individuals (potential customers).
  - Analyze the consumption preferences of high-income and high-consumption customers.
  - View customer group distribution.
  - Quickly extract recently active average consumers.

---

## Integrated Analysis
This labeling system incorporates:
- **RFM analysis**: Recency, Frequency, and Monetary value metrics.
- **Survival analysis**: Customer lifecycle modeling.
- **Cluster analysis**: Grouping similar customers together.
- **Statistical analysis**: Profiling customers based on demographic and behavioral data.

### Key Benefits
This comprehensive customer profiling system can be used for:
- **Precision marketing**: Targeting specific customer segments effectively.
- **Customer relationship management (CRM)**: Enhancing customer satisfaction and retention.

### Example Use Cases
1. Identifying potential high-value customers.
2. Customizing marketing strategies based on customer preferences.
3. Understanding customer churn and re-engagement strategies.
4. Evaluating customer segmentation and group behaviors.

