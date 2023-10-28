--- I wrote the following code on a school computer then pasted it on my laptop on Visual Studio

--- Question 1
SELECT 
    date,
	sum(impressions) AS total_impressions
FROM marketing_data
GROUP BY date
ORDER BY date;

--- Question 2 The third best state generated 37577
SELECT 
    state, 
    sum(revenue) AS total_revenue
FROM website_revenue
GROUP BY state
ORDER BY total_revenue desc


--- Question 3
SELECT 
	camp.name,
	sum(cost) AS total_cost,
	sum(impressions) AS total_impressions,
	sum(clicks) AS total_clicks,
	sum(revenue) AS total_revenue
FROM campaign_info camp 
	LEFT JOIN marketing_data mk ON camp.id = mk.campaign_id
	LEFT JOIN website_revenue web ON camp.id = web.campaign_id
GROUP BY name;

--- Question 4
SELECT 
	right(geo, 2) AS state,
	sum(conversions) AS total_conversions
FROM campaign_info camp
RIGHT JOIN marketing_data mk ON camp.id = mk.campaign_id
WHERE camp.name = 'Campaign5'
GROUP BY geo;

--- Question 5
--- In my opinion, campaign 3 was the most efficient because it made the most revenue. Other factors are that campaign
--- 3 was able to reach all cities while mainting one of the higher conversion per clicks, 

SELECT 
	camp.name, 
	sum(web.revenue) AS total_revenue
FROM campaign_info camp, marketing_data mk,	website_revenue web
where camp.id = mk.campaign_id
AND camp.id = web.campaign_id
GROUP BY camp.name
order by sum(web.revenue) desc;
