Record my work of data analysis ,data warehouse ,data visualization ,data lineage and data related algorithms
# My-data-analysis-project
## Data-analysis

- 01.Data-Analysis--Evaluating-the-Benefits-of-Holding-Strategy-in-Inflationary-Bull-Market
- 02.Data-Analysis-China-Automobile-and-New-Energy-Electric-Vehicle-Sales-from-2020-to-2024
- 03.rsna-2023-abdominal-trauma-detection
- 04.Retail scenario data analysis
  - offline catering industry -Deduce the number of diners through batch data
  - online coupon test design
    - How to get the minimum sample size
  - CustomerGroup Kmeans
  - Membership Churn Model- lifetimes
  - Customer Labeling System
- 05.E-commerce Scenario Data Analysis
  - user behavior analysis

User Behavior refers to the actions that users perform on a product.
- Login
- Browsing
- Adding to Cart or Purchasing


#### Retention Rate
- Retained Users: Users who start using the product at a certain time and still continue to use the product after a period of time.
- Retention Rate: The number of users who still use the product / The total number of initial users
#### Repeat Purchase Rate and Repurchase Rate
The repeat purchase rate is the proportion of users who consume twice or more within a certain time window among all consuming users.
#### Repurchase Rate
The proportion of users who consume in one time window and still consume in the next time window.
#### E-commerce Funnel Analysis
#### What is Funnel Analysis?
- In simple terms, it is to abstract a certain process and observe the conversion and loss at each step of the process.
- Time: Refers to the conversion cycle of the funnel, that is, the collection of the time required to complete the funnel.
- Nodes: Each layer of the funnel is a node.
- Traffic: Refers to the user group.

#### E-commerce Funnel Analysis - Nodes
- Click
- Favorite
- Purchase
- Adding to Cart

#### Interpretation of Analysis Results
- Acquiring Users
  - The trends of PV (Page Views) and UV (Unique Visitors) are the same, which conforms to the normal pattern.
On November 11th, both PV and UV showed an upward trend, while this did not happen last week. It is speculated that the traffic was brought by the Double 11 event.

  - The click volume is the lowest from 0 to 6 am every day, and it is also the time when the number of user visits is the lowest.
  - The peak user activity period is from 10 am to 10 pm, and the intensity of event promotion can be increased during the peak user activity period.
- Repeat Purchase Rate and Repurchase Rate
  - The user repurchase rate shows an upward trend.
  - The user repeat purchase rate shows a trend of first decreasing and then increasing, and while the repeat purchase rate is increasing, the repurchase rate is also increasing. It can be seen that user loyalty is increasing.

- Order Analysis
  - The trends of the number of purchasers and the purchase rate are roughly the same before November 10th. Starting from the 11th, the number of purchasers increases, but the purchase rate decreases compared with before. At this time, the product should be optimized and promotion efforts should be increased. 

- Funnel Analysis
  - Among the total clicks, 6.21% are added to the shopping cart, 3.31% are added to favorites, and only 2.22% end up purchasing.
As can be seen from the figure, the conversion rate of the link from click to adding to cart is the lowest. According to the user behavior path of click - adding to cart - favorite - purchase, we can indirectly increase user purchases by optimizing the conversion rate of the link from click to adding to cart.
