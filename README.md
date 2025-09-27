# PL/SQL – Assignment

**Course:** INSY 8311 – Database Development with PL/SQL   
**Assignment Date:** September 19, 2025  
**Deadline:** September 29, 2025 (11:59 PM)

---

## 📌 Business Problem Definition

### Business Context

- **Company Type:** Rwanda Coffe Distribution
- **Context:** Regional coffee distributor in Rwanda selling to retailers across Kigali, Musanze, and Huye


### Data Challenge

 Need to analyze sales performance by region, identify top products, track monthly trends, and segment customers for targeted marketing.
 

### Expected Outcome

Insights to optimize inventory allocation, design regional promotions, and improve customer retention strategies.


### Success Criteria

- **Top 3 players by average rating per team** → `RANK()`
- **Running total of goals and 3-game performance metrics** → `SUM() OVER()`
- **Match-to-match performance growth percentage** → `LAG()`/ `LEAD()`
- **Player performance quartiles** → `NTILE(4)`
- **Cumulative performance distribution** → `CUME_DIST()`

---


## Database Schema

### Tables

- **Product Table** → Stores Product information information
- **Customer Table** → Store player details of Shop or restauranr that command 
- **Transaction Table** → Transaction done all over the 12 mont
<img width="1920" height="1080" alt="cmd1" src="https://github.com/user-attachments/assets/9fef066d-02e8-4cbc-9be6-7ef48439dfa4" />
<img width="1920" height="1080" alt="cmd2" src="https://github.com/user-attachments/assets/d3c6a1fa-f21e-42e5-a676-33e33c23264b" />
<img width="1920" height="1080" alt="cmd3" src="https://github.com/user-attachments/assets/5f780328-3906-46d1-9ea6-095e0eb593fd" />
<img width="1920" height="1080" alt="cmd4" src="https://github.com/user-attachments/assets/f7bb0121-4774-49a9-bd2c-51363c5ad1d4" />

### Sample Data


Dataset **this include data from last year**  
From different sector in rwanda and the transaction done
<img width="1920" height="1080" alt="Product" src="https://github.com/user-attachments/assets/39bf8e30-681a-4761-b15c-c7560129603a" />
<img width="1920" height="1080" alt="Customer" src="https://github.com/user-attachments/assets/e992d844-bc34-42df-a734-57f59696201d" />
<img width="1920" height="1080" alt="Transaction" src="https://github.com/user-attachments/assets/3b3f96e4-7cb8-4bf7-a79a-c670c9fde27c" />


## Window Functions Implementation

### 1. Ranking

**The ranking functions show which customers generate the most revenue,
allowing the business to identify top performers and potential high-value clients.
ROW_NUMBER assigns unique positions, RANK and DENSE_RANK handle ties differently
and PERCENT_RANK shows each customer’s relative position as a percentage of the total**
<img width="1920" height="1080" alt="Ranking" src="https://github.com/user-attachments/assets/f1b66d95-4992-48bf-b99c-d5bc1e11067f" />

---

### 2. Aggregate

**ROWS** → strictly counts physical rows in the window.
**RANGE** → includes all rows with values in the ORDER BY column that fall within the value range.
<img width="1920" height="1080" alt="Aggregate-Range" src="https://github.com/user-attachments/assets/c2d5d2d6-682a-4204-a29e-045efce9b38f" />
<img width="1920" height="1080" alt="Aggregate-Row" src="https://github.com/user-attachments/assets/0ec183d7-6c26-47fc-8e14-5e5b13b97552" />

---

### 3. Navigation

The LAG() function allows comparison of a current period’s sales with the previous period,
making it easy to calculate growth percentages. This helps identify trends and measure how
sales are increasing or decreasing over time for each product or region.
<img width="1920" height="1080" alt="Navigation" src="https://github.com/user-attachments/assets/7505927d-bda7-4a2e-8a78-12543ffaac03" />

---

### 4. Distribution


**NTILE(n)** → Divides rows into n roughly equal groups (quartiles, deciles, etc.).
**CUME_DIST()** → Calculates the cumulative distribution (percentage of rows below or equal to the current row)
<img width="1920" height="1080" alt="Distribution" src="https://github.com/user-attachments/assets/2e20682e-8863-4037-93c4-82a535684a15" />



## Results Analysis

### Descriptive Analysis: What Happened?

**Sales Performance Overview**
Total Annual Revenue: 2.1 million RWF generated across all regions
Regional Distribution: Kigali dominated with 48% of total sales, followed by Musanze (32%) and Huye (20%)
Seasonal Patterns: Clear Q4 peak with December sales 45% above annual average
Product Performance: Coffee beans category generated 65% of total revenue, with Arabica Premium as top performer

**Customer Behavior Patterns**
Customer Concentration: Top 3 customers contributed 40% of total revenue
Spending Distribution: NTILE(4) analysis revealed Quartile 1 customers (top 25%) generated 60% of total revenue
Transaction Patterns: Average transaction value showed 15% monthly growth trend

**Time-Based Trends**
Running Totals: Steady upward trajectory with consistent monthly growth
Moving Averages: 3-month moving average showed smoothing of seasonal fluctuations
Month-over-Month Growth: Average 12% monthly growth with peaks in April (35%) and November (40%)


### Diagnostic Analysis: Why Did It Happen?

**Regional Performance Drivers**
Urban Concentration Effect: Kigali's higher population density and commercial activity drove 48% revenue share
Tourism Impact: Musanze's performance correlated with tourism seasons (25% higher sales during peak months)
Institutional Demand: Huye's steady performance driven by university and institutional clients

**Product Success Factors**
Premium Preference: 30% price premium for Arabica Premium didn't deter demand, indicating market readiness for quality products
Category Dominance: Coffee beans' 65% revenue share reflects core business alignment with customer expectations
Seasonal Product Alignment: Higher-margin products performed better during holiday seasons

**Customer Behavior Drivers**
B2B vs B2C Patterns: Business clients (cafes, resorts) showed higher transaction values but lower frequency
Loyalty Effect: Repeat customers demonstrated 50% higher lifetime value than one-time purchasers
Geographic Concentration: 70% of top-quartile customers located in urban centers


### Prescriptive Analysis: What Should We Do Next?

**Immediate Actions (Next 3 Months)**
Inventory Optimization
Increase Q4 stock levels by 35% based on historical patterns
Implement just-in-time inventory for premium products to reduce carrying costs
Develop regional inventory allocation model weighted by historical performance
Develop personalized pricing for top 10% customers based on purchase history

**Medium-Term Initiatives (3-12 Months)**
Regional Expansion Plan
Replicate Kigali's premium product strategy in Musanze and Huye
Invest in sales infrastructure in emerging markets showing >20% growth potential
Develop region-specific product bundles based on local preferences
Product Portfolio Optimization

**Strategic Recommendations (12+ Months)**
Market Development
Expand to 2 new regions showing similar demographic profiles to top-performing areas
Develop B2B partnership program with hotels and resorts in tourism zones
Invest in digital sales channels to complement physical distribution


## References


-[Advanced SQL: Window Functions by FreeCodeCamp](https://www.youtube.com/watch?v=H6OTMoXjNiM)
-[Complete SQL Window Functions Course](https://www.youtube.com/watch?v=H6OTMoXjNiM)
-[Oracle SQL Analytical Functions](https://www.youtube.com/watch?v=Qj0Dg-RfggE)
-[Database Trends Webinars](https://www.dbta.com/Webinars/)
-[Analytic Functions](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/Analytic-Functions.html)
-[Oracle Live SQL](https://livesql.oracle.com/)


