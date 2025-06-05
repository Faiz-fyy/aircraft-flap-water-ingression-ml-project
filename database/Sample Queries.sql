-- Last 30 days Inspections
SELECT i.*, p.PN, rd.Relative_Day
FROM inspections AS i
JOIN parts AS p ON i.SN_ID = p.SN_ID
JOIN relative_date rd ON i.Date_ID = rd.Date_ID
WHERE rd.Relative_Day >= -30;

-- Seasonal Water Ingression
SELECT p.PN, p.Position, COUNT(*) AS water_ingress
FROM inspections AS i
JOIN parts AS p ON i.SN_ID = p.SN_ID
WHERE i.Water = TRUE
GROUP BY p.PN, p.Position
ORDER BY water_ingress DESC;

-- Water Ingressed Parts
SELECT p.PN, p.Position, COUNT(*) AS water_ingress
FROM inspections AS i
JOIN parts AS p ON i.SN_ID = p.SN_ID
WHERE i.Water = TRUE
GROUP BY p.PN, p.Position
ORDER BY water_ingress DESC;

-- Temporal Trend (Quarter)
SELECT rd.Relative_Quarter, COUNT(*) AS Total_Inspections, SUM(i.Water) AS Water_Cases, ROUND(AVG(i.Water) * 100, 2) AS Water_Rate_Percent
FROM inspections AS i
JOIN relative_date AS rd ON i.Date_ID = rd.Date_ID
GROUP BY rd.Relative_Quarter
ORDER BY rd.Relative_Quarter;
