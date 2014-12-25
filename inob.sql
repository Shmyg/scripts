SELECT	owner,
	object_name,
	object_type
FROM	dba_objects
WHERE	status = 'INVALID'
ORDER	BY 1, 2
/
