--Calculations using SQL
--Dataset: Avocado dataset from Kaggle.
--Objectives: 1. Create a calculated total field and compare it with the total bags columns.
SELECT
  Small_Bags,
  Large_Bags,
  XLarge_Bags,
  Total_Bags,
  (Small_Bags + Large_Bags + XLarge_Bags) AS Total_Bags_Calc
FROM
  avocado_data.avocado_prices;

--2. Percent of small bags, large bags and XLarge bags of the Total bags.
SELECT
  COUNT(*) AS count
FROM
  avocado_data.avocado_prices
WHERE
  Total_Bags = 0;
--From this, 15 rows have a total of 0.

SELECT
  (Small_Bags/Total_Bags) * 100 AS percent_small_bags,
  (Large_Bags/Total_Bags) * 100 AS percent_large_bags,
  (XLarge_Bags / Total_Bags) * 100 AS percent_xlarge_bags
FROM
  avocado_data.avocado_prices;

--This query gives an error since we are dividing  number by zero. To do this, we will need to exclude the cases where total bags <>0

--3. Find percentage where totals > 0
SELECT
  (Small_Bags/Total_Bags) * 100 AS percent_small_bags,
  (Large_Bags/Total_Bags) * 100 AS percent_large_bags,
  (XLarge_Bags/Total_Bags) * 100 AS percent_xlarge_bags
FROM
  avocado_data.avocado_prices
WHERE
  Total_Bags <> 0;