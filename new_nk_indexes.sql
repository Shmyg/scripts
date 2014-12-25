INSERT	INTO nk_indexes
	(
	SELECT	di.index_name,
		di.table_name,
		ds.tablespace_name,
		TRUNC( SYSDATE ),
		NULL,
		TRUNC( SYSDATE ),
		ds.bytes,
		di.owner
	FROM	dba_indexes	di,
		dba_segments	ds,
		non_kernel_users	nk
	WHERE	di.owner = nk.username
	AND	di.index_name = ds.segment_name
	AND	ds.segment_type = 'INDEX'
	AND	ds.owner = nk.username
	)
/
