INSERT	INTO nk_tables
	(
	SELECT	dt.table_name,
		ds.tablespace_name,
		TRUNC( SYSDATE ),
		ds.bytes,
		TRUNC( SYSDATE ),
		dt.owner
	FROM	dba_tables	dt,
		dba_segments	ds,
		non_kernel_users	nk
	WHERE	dt.table_name = ds.segment_name
	AND	nk.username = dt.owner
	AND	ds.segment_type = 'TABLE'
	AND	ds.owner = nk.username
	)
/
