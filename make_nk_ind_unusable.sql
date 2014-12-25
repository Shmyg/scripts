SPOOL make_nk_ind_unusable_run.sql

SELECT 'alter index ' || owner || '.' || index_name || ' unusable;'
FROM	dba_indexes
WHERE	owner IN
	(
	SELECT	username
	FROM	non_kernel_users
	)
/

spool off

@make_nk_ind_unusable_run.sql

!rm make_nk_ind_unusable_run.sql
