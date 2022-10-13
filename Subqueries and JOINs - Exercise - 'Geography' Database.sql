-- 12.	Highest Peaks in Bulgaria

SELECT m_c.`country_code`, m.`mountain_range`, p.`peak_name`, p.`elevation` 
FROM `mountains_countries` AS  m_c
JOIN `mountains` AS m
ON m_c.`mountain_id` = m.`id`
JOIN `peaks` AS p
ON  m.`id` = p.`mountain_id`
where  p.`elevation` > 2835 AND m_c.`country_code` = 'BG'
ORDER BY p.`elevation` DESC;


-- 13.	Count Mountain Ranges

SELECT m_c.`country_code`, COUNT(m.`mountain_range`) AS mountain_range
FROM `mountains_countries` AS  m_c
JOIN `mountains` AS m
ON m_c.`mountain_id` = m.`id`
GROUP BY m_c.`country_code`
HAVING m_c.`country_code` IN ('BG', 'RU', 'US')
ORDER BY  mountain_range DESC;


-- 14.	Countries with Rivers

SELECT c.`country_name`, r.`river_name` 
FROM `countries` AS c
JOIN `continents`
ON c.`continent_code` = `continents`.`continent_code`
LEFT JOIN `countries_rivers` AS c_r
ON c.`country_code` = c_r.`country_code`
LEFT JOIN `rivers` AS r
ON c_r.`river_id` = r.`id`
WHERE `continents`.`continent_code` = 'AF'
ORDER BY  c.`country_name`
LIMIT 5;


-- 15.	*Continents and Currencies

SELECT `continent_code`, `currency_code`, COUNT(`currency_code`) AS currency_usage FROM `countries` AS c
GROUP BY `continent_code`, `currency_code`
HAVING currency_usage  > 1 AND currency_usage = (SELECT COUNT(`currency_code`) AS c_usage FROM `countries` AS c2
WHERE  c.`continent_code` = c2.`continent_code`
GROUP BY  c2.`currency_code`
ORDER BY c_usage DESC
LIMIT 1)
ORDER BY `continent_code`, `currency_code`;


-- 16.  Countries Without Any Mountains

SELECT COUNT(c.`country_code`) AS country_count FROM `countries` AS c
LEFT JOIN `mountains_countries` AS  m_c
ON c.`country_code` = m_c.`country_code`
WHERE m_c.`country_code` IS NULL;


-- 17.  Highest Peak and Longest River by Country

SELECT c.`country_name`, Max(p.`elevation`) AS highest_peak_elevation, Max(r.`length`) AS longest_river_length FROM `countries` AS c
LEFT JOIN `mountains_countries` AS  m_c
ON c.`country_code` = m_c.`country_code`
LEFT JOIN `peaks` AS p
ON m_c.`mountain_id` = p.`mountain_id`
LEFT JOIN `countries_rivers` AS c_r
ON c.`country_code` = c_r.`country_code`
LEFT JOIN `rivers` AS r
ON c_r.`river_id` = r.`id`
GROUP BY c.`country_name`
ORDER BY highest_peak_elevation DESC , longest_river_length  DESC, c.`country_name`
LIMIT 5;
