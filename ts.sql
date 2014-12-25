SELECT	owner,
	SUM( bytes ) / ( 1024 * 1024 )
FROM	dba_segments
WHERE	segment_name = UPPER( '&1' )
GROUP	BY owner
/
