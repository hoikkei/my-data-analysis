

- 04.Retail scenario data analysis
  - offline catering industry -Deduce the number of diners through batch data
  - AB test for online coupon test design
    - How to get the minimum sample size
  - CustomerGroup Kmeans
  - Membership Churn Model- lifetimes

1. Industry
This model is applicable to any business model with a membership system in e-commerce and retail.
2. Core Method: Lifetimes Model
1/Lifetimes Model: Predicting User Transaction Behaviors

### 1/Lifetimes Model: Predicting User Transaction Behaviors
#### Application Area One of the Lifetimes Model: E-commerce
- Abundant and Complete User Transaction Data: In terms of data, the e-commerce field has inherent advantages. Customers' transaction behaviors, including time, amount, and frequency, are all recorded very completely.
- Multiple Touch Points: The e-commerce platform itself is a natural user touch point. After completing various predictions of the user lifecycle, it can utilize high-traffic points to reach users and conduct differentiated management.
- Relatively High User Transaction Frequency: The richer the user behavior data, the more thoroughly the model can learn about user habits. Therefore, a naturally high transaction frequency means that there is more room for the algorithm to exert its effectiveness.

#### Application Area Two of the Lifetimes Model: Retail
- Increasing Digitalization of Offline Physical Stores: Traditional retail, which is mainly based on offline stores, is currently undergoing digital innovation. Membership systems and intelligent ordering have made customer behavior and transaction data in traditional retail unprecedentedly abundant.
- High Demand: The retail business in physical operations is more in line with the traditional concept of regular customers. Especially for large chain enterprises, making customers feel like "regular customers" in any store is one of the important tasks of the Lifetimes model.

#### Application Area Three of the Lifetimes Model: Education
- Maintenance of User Enthusiasm for Classes and Payment Upgrades: By learning from users' historical attendance performance, their future activity levels can be predicted. This has direct guiding significance for preventing refunds and payment upgrades.
- Personalized After-sales Service and Tracking: Based on different user lifecycle values, limited after-sales service and tracking efforts can be spent on users with the greatest potential value.
- The Lifetimes model can make the most of existing user transaction data to predict users' activity levels, future transactions, and spending, thereby effectively dividing existing users and supporting user management strategies for refined operations.
- Almost all refined management depends on touch points between enterprises and users, and effective touch points are the key to the success or failure of user personalized operations.
In any field where transaction records can be matched with user identities, there is room for the Lifetimes model to play its role. The effectiveness of the model depends on the quality and quantity of user records.

#### 2/Lifetimes Model Principles
- Using R, F, M to Describe User Transactions
- User transaction behaviors may seem complex, but they can be characterized by three very simple aspects, namely Recency of transactions, Frequency of repurchases, and Monetary value of repurchase transactions.

#### 3/Theoretical Basis for Predicting Users' Future Based on RFM
-Four Assumptions:
  - The number of repurchases within the active period of a user is a random process (Poisson distribution), which is affected by the transaction rate.
For example, if a person's transaction rate is 0.25, the number of transactions he will generate in the next 10 days is 2.5.
  - The transaction rate varies from person to person, but this difference (probability density function of non-uniformity) can be described by a certain probability distribution (Gamma distribution).
For example, Zhang San's daily transaction rate is 0.25, and Li Si's daily transaction rate is 0.1, but their transaction rates follow the same probability distribution. By finding this probability distribution, the daily transaction rate of a new person can be predicted.
  - Whether a user exits (the end of the lifecycle) is another random process (Binomial distribution), which is affected by the churn probability.
Similarly, if a customer's daily churn probability is 0.1, his churn probability within the next 10 days will be very high.
  - The churn probability also varies from person to person, but this difference (probability density function of non-uniformity) can also be described by a specific probability distribution (Beta distribution).

Similarly, one person's churn probability is 0.5, and another's is 0.1, but they follow the same probability distribution. By finding this specific distribution, the churn probability of a new person can be predicted.
Three-Indicator Prediction Model

#### Conclusion
- The Lifetimes model can only calculate the churn probability for users with two or more purchase frequencies.
- The ranking of churn risk can be identified based on the ranking of predictions of future user visits and spending.
- After setting the threshold manually, users can be classified for further management.
- When facing the problem of how to maximize the allocation of limited campaign funds, the target population most suitable for investment can be obtained by adjusting the threshold or directly using the ranking.