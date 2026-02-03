USE practice1; -- selecting the database
SELECT * FROM bikesales; -- taking a look at the entire data
-- Let's see the top 10 countries with the costliest average bike sales
SELECT Country, AVG(`Unit_Cost ($)`) AS Avg_Cost
FROM bikesales GROUP BY Country
ORDER BY Avg_Cost DESC;
-- Germany is the country with the costliest average bike sales
-- Now, let's see the states in Germany with the costliest average bike sales
SELECT State, AVG(`Unit_Cost ($)`) AS Avg_Cost
FROM bikesales WHERE Country = 'Germany'
GROUP BY State ORDER BY Avg_Cost DESC;
-- Hamburg is the city with costliest avg sales in Germany, let's see more about this city
SELECT State, AVG(`Profit ($)`), AVG(`Revenue ($)`)
FROM bikesales WHERE State = 'Hamburg'
GROUP BY State; -- the avg profit and revenue that Hamburg made through bike sales
-- Let's see the countries with the highest total revenue made through bike sales
SELECT Country, SUM(`Revenue ($)`) AS Total_Revenue
FROM bikesales GROUP BY Country
ORDER BY Total_Revenue DESC;
-- Now, let's also check the countries with the highest total profit made through bike sales
SELECT Country, SUM(`Profit ($)`) AS Total_Profit
FROM bikesales GROUP BY Country
ORDER BY Total_Profit DESC;
-- Let's check which gender bought more quantity of bikes
SELECT Customer_Gender, SUM(Order_Quantity) AS Total_Quantity
FROM bikesales GROUP BY Customer_Gender
ORDER BY Total_Quantity DESC;
-- Let's check which gender from which country and state bought highest quantity of bikes
SELECT Customer_Gender, Country, State, SUM(Order_Quantity) AS Total_Quantity
FROM bikesales GROUP BY Customer_Gender, Country, State
ORDER BY Total_Quantity DESC;
-- Let's check customers of which age group bought more quantity of bikes
SELECT Age_Group, SUM(Order_Quantity) AS Total_Quantity
FROM bikesales GROUP BY Age_Group
ORDER BY Total_Quantity DESC; 
-- Let's check customers of which age group, gender and country usually buy costly bikes
SELECT Age_Group, Customer_Gender, Country, AVG(`Unit_Cost ($)`) AS Avg_Cost
FROM bikesales GROUP BY Age_Group, Customer_Gender, Country
ORDER BY Avg_Cost DESC;