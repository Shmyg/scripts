SELECT	object_type,
	owner
FROM	dba_objects
WHERE	object_name = UPPER( '&1' )
/
