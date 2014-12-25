SET LINESIZE 1000
COLUMN what FOR a100
SELECT	job,
	what,
	failures
FROM	user_jobs
/
