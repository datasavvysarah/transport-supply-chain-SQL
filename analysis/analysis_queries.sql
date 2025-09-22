SHOW TABLES;

SELECT *
	FROM Supply_chain_dataanalysis;
    
ALTER TABLE Supply_chain_dataanalysis
ADD COLUMN `Shipping Carriers` VARCHAR(50);

-- 1. Average Lead Time Across Different Transportation Modes and Routes
SELECT `Transportation mode`, AVG(`Lead time`) AS avg_Lead_Time
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Transportation mode`;

-- 2. Transportation mode with Lowest Cost-to-Benefit Ratio for each product type
select
	`Product type`,
    `Transportation mode`,
	SUM(`Manufacturing costs`)/SUM(`Revenue Generated`) AS Cost_to_Benefit_Ratio
	FROM Supply_Chain_DB.Supply_chain_dataanalysis
    GROUP BY `Product type`, `Transportation mode`
    ORDER BY Cost_to_Benefit_Ratio ASC;
    
-- 3. Correlation Between Manufacturing Lead Time and Overall Shipping Time
SELECT 
    (COUNT(*) * SUM(`Manufacturing lead time` * `Shipping times`) - 
    SUM(`Manufacturing lead time`) * SUM(`Shipping times`)) /
    (SQRT((COUNT(*) * SUM(POWER(`Manufacturing lead time`, 2)) - POWER(SUM(`Manufacturing lead time`), 2)) * 
          (COUNT(*) * SUM(POWER(`Shipping times`, 2)) - POWER(SUM(`Shipping times`), 2)))) 
    AS correlation_coefficient
FROM Supply_Chain_DB.Supply_chain_dataanalysis;


-- 4. Supplier with Lowest Defect Rates
SELECT `Supplier name`, AVG(`Defect rates`) AS Avg_defect_rate
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Supplier name`
ORDER BY Avg_defect_rate ASC
LIMIT 1;

-- 5. Dufferent Product Types and Suppliers Defect Rate Variations
SELECT `Product type`,`Supplier name`, AVG(`Defect rates`) AS Avg_defect_rate
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Product type`,`supplier name`
ORDER BY Avg_defect_rate DESC;

-- 6. Routes or Carriers with Highest Transportation Costs
SELECT `Routes`, `Shipping Carriers`,
       AVG (`Costs`) AS avg_transport_cost
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Routes`,`Shipping Carriers`
ORDER BY avg_transport_cost DESC;

-- 7. Average Maunfacturing Lead Time per Supplier
SELECT `Supplier name`, AVG(`Lead time`) AS Avg_LEAD_TIME
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Supplier name`;

-- 8. Product Types with the Highest Defect Rates
SELECT `Product type`, AVG(`Defect rates`) AS avg_defect_rate
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Product type`
ORDER BY avg_defect_rate DESC
LIMIT 5;

-- 9. Relationship Between Manufacturing Cost and Defect Rates 
SELECT `Manufacturing costs`, 
       AVG(`Defect rates`) AS avg_defect_rate
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Manufacturing costs`
ORDER BY `Manufacturing costs` ASC;

-- 10. Products Types at risks of stockouts
SELECT `Product type`, `Stock levels`, 
       CASE 
           WHEN `Stock levels` < 10 THEN 'High Risk' 
           WHEN `Stock levels` BETWEEN 10 AND 30 THEN 'Medium Risk'
           ELSE 'Low Risk'
       END AS stockout_risk
FROM Supply_Chain_DB.Supply_chain_dataanalysis
ORDER BY stockout_risk DESC;

-- 11. Lead Time Variation Between Suppliers & Impact on Inventory
SELECT `Supplier name`, 
       AVG(`Lead time`) AS avg_lead_time, 
       AVG(`Stock levels`) AS avg_inventory_level
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Supplier name`
ORDER BY avg_lead_time ASC;

-- 12. Relationship between shipping carrier performance and lead times
SELECT `Shipping carriers`, 
       AVG(`Shipping times`) AS avg_shipping_time, 
       COUNT(*) AS total_shipments
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Shipping carriers`
ORDER BY avg_shipping_time ASC;

-- 13️ Highest Revenue-Generating Product Types & Defect Rates
SELECT `Product type`, 
       SUM(`Revenue Generated`) AS Total_revenue, 
       AVG(`Defect rates`) AS avg_defect_rate
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Product type`
ORDER BY Total_revenue DESC;

-- 14 Customer Demographics & Product Preferences
SELECT `Customer demographics`, 
       `Product type`, 
       COUNT(*) AS Total_purchases
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Customer demographics`, `Product type`
ORDER BY Total_purchases DESC;

-- 15 Highest Benefit-to-Sales Ratio by Region
SELECT `Location`, 
       `Product type`, 
       `Revenue Generated`,
       (SUM(`Revenue Generated`) - SUM(`Manufacturing costs`)) / SUM(`Revenue Generated`) AS Benefit_to_sales_ratio
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Location`, `Product type`,`Revenue Generated` 
ORDER BY Benefit_to_sales_ratio DESC;

 -- 16. Supplier with Highest Defect Rates
SELECT `Supplier name`, AVG(`Defect rates`) AS Avg_defect_rate
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Supplier name`
ORDER BY Avg_defect_rate DESC
LIMIT 1;

-- 17. Routes or Carriers with Highest Transportation Costs
SELECT  `Shipping Carriers`,
       AVG (`Costs`) AS avg_shippingcarriers_cost
FROM Supply_Chain_DB.Supply_chain_dataanalysis
GROUP BY `Shipping Carriers`
ORDER BY avg_shippingcarriers_cost DESC;