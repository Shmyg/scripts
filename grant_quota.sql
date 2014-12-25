SET	PAGESIZE 0
SET	ECHO OFF

SELECT	'ALTER USER ' || username || ' QUOTA ' ||
	DECODE ( max_bytes, -1, ' UNLIMITED', max_bytes ) ||
	' ON ' || tablespace_name || ';' 
FROM	dba_ts_quotas
WHERE	username = UPPER( '&1' )
/
