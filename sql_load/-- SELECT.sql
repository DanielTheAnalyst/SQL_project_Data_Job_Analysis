-- SELECT
--     job_schedule_type AS job_schedule,
--     AVG(salary_year_avg) AS avg_yearly_salary,
--     AVG(salary_hour_avg) AS avg_hourly_salary
-- FROM 
--     job_postings_fact
-- GROUP BY
--     job_schedule_type
-- LIMIT 20;


SELECT
    EXTRACT(MONTH FROM (job_posted_date AT TIME ZONE 'UTC'
                        AT TIME ZONE 'America/New_York')) AS month,
    COUNT(*) AS job_posting_count
FROM
    job_postings_fact
WHERE
    EXTRACT(YEAR FROM (job_posted_date AT TIME ZONE 'UTC'
                        AT TIME ZONE 'America/New_York')) = 2023
GROUP BY month
ORDER BY month;                

SELECT 
    EXTRACT(MONTH FROM (
        job_posted_date AT TIME ZONE 'UTC' 
        AT TIME ZONE 'America/New_York'
    )) AS month,
    COUNT(*) AS job_posting_count
FROM job_postings_fact
WHERE EXTRACT(YEAR FROM (
        job_posted_date AT TIME ZONE 'UTC' 
        AT TIME ZONE 'America/New_York'
    )) = 2023
GROUP BY 
    EXTRACT(MONTH FROM (
        job_posted_date AT TIME ZONE 'UTC' 
        AT TIME ZONE 'America/New_York'
    ))
ORDER BY month;