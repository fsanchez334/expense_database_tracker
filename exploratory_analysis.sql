--We can query the table to group by the category to see how much has been spent so far
SELECT category, SUM(AMOUNT) AS 'Amount Spent'
FROM expenses
GROUP BY category;

-- We can extend this further by turning the above query to get the amount spent as a percentage
SELECT 
    category,
    `Amount Spent`,
    (`Amount Spent` / total_spent * 100) AS `Percentage Spent`
FROM (
    SELECT 
        category, 
        SUM(amount) AS `Amount Spent`,
        (SELECT SUM(amount) FROM expenses) AS total_spent
    FROM expenses
    GROUP BY category
) AS t;