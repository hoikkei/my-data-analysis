Record my work of data analysis ,data warehouse ,data visualization ,data lineage and data related algorithms
# My-data-analysis-project
## Data-analysis

With the number of diners, we can add many new KPIs, such as per capita spending, number of products per capita, etc.
Based on the newly added number of diners, we can learn about dining scenarios in various time slots throughout the day. For example, when is it most likely for people to eat alone, when is it most likely for two people to have a meal together, and when is it most likely for a large group to have a banquet, etc.
For users with a relatively fixed number of diners, can we consider launching some customized packages or promotional products to boost the business performance during each meal period?

- 04.Retail scenario data analysis
  - offline catering industry -Deduce the number of diners through batch data

#### How to Determine the Number of Diners
- 1.Ignore the condiments and side dishes in a single order.
- 2.Count the quantity of staple foods in a single transaction, and - 3.calculate the number of diners with a coefficient of 1.
- 4.Count the quantity of beverages in a single transaction, and calculate the number of diners with a coefficient of 1.
- 5.Count the quantity of snacks in a single transaction, and calculate the number of diners with a coefficient of 0.5.
- 6.Take the maximum value among the three, round it down, and obtain the number of diners in a single order.

#### Table Structures
- ds_indian_restaurants_orders.csv:
  - Order Number
  - Order Date
  - Item Name
  - Quantity
  - Total products
  - brand_tag
- ds_indian_restaurants_products_type:
  - ItemName/Product
  - brand_tag
  - food_type
  - Price (e.g., 2.95)

Observed Data Characteristics
The order table (ds_indian_restaurants_orders.csv) records specific order information. The product table (ds_indian_restaurants_products_type) contains basic product information and categorization. The two tables are associated through the brand_tag field.

#### Explanation of SQL Code
- 01.Counting and Sorting the Number of Different Product Names by Food Type in the Product Detail Table:
- 02.Creating a New Table and Redefining Product Categories:
- 03.Viewing the Situation after Redefining Product Categories:
- 04.Joining the Transaction Detail Table with the Product Detail Table and Adding Product Categories and Prices:
- 05.ggregating and Calculating the Join Results:
- 06.Comparing the Maximum among Staple Foods, Beverages, and Snacks:
- 07.Adding Rounding Down Logic and Ensuring the Minimum Number of Diners is 1:
- 08.Creating a New Table to Store the Final Results:
- 09.Checking the Proportion of Estimated Anomalies Caused by Excessive Beverages:
- 10.Conducting Analysis on the Number of Diners:

These SQL codes perform a series of data processing and analysis tasks, including reclassifying products, joining order and product tables, calculating order amounts, estimating the number of diners, counting anomalies, and analyzing business metrics for different brands. Through step-by-step processing and calculation, the data is finally organized into the pj_indian_food_partysize table, and multi-dimensional analysis is performed on the data in this table.
Explanation

This document provides a method for determining the number of diners based on the given data. It describes how to calculate the number of diners by considering different types of products (staple foods, beverages, and snacks) in orders, using different coefficients for each type. It also details the structures of the relevant tables and the characteristics of the data, as well as an explanation of a series of SQL code that processes and analyzes the data, showing the workflow from data processing to final analysis and storage, which is crucial for data analysis and business decision-making.

