SELECT cohorts.name AS cohort, SUM(completed_at - started_at) AS total_duration
FROM assistance_requests
JOIN students ON assistance_requests.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE completed_at IS NOT NULL
GROUP BY cohorts.id, cohorts.name
ORDER BY total_duration;