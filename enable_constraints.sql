/*
|| Script to enable all disabled constraints for a schema
|| $Log: enable_constraints.sql,v $
|| Revision 1.1  2014/10/13 09:07:12  shmyg
|| Added two scripts for constraints
||
||
*/

SET PAGESIZE 0
SET TRIMSPOOL ON
SET LINESIZE 32767
SET TAB OFF
SET FEEDBACK OFF
SET ECHO OFF
SET VERIFY OFF
SET TERMOUT OFF
SET RECSEP OFF

COLUMN begin_date new_val start_date
SELECT  TO_CHAR( SYSDATE, 'YYYYMMDDHH24MI' ) begin_date
FROM    DUAL; 

SPOOL enable_novalidate_oms_constraints_&&start_date..sql

SELECT  'alter table oms.' || table_name ||
        ' modify constraint ' || constraint_name || ' enable validate;'
FROM    dba_constraints
WHERE   owner = 'OMS'
AND     (
	status = 'DISABLED'
	OR
	validated = 'NOT VALIDATED'
	)
AND	constraint_type NOT IN ('O', 'V');

SPOOL OFF

START   enable_novalidate_oms_constraints_&&start_date..sql

!rm enable_novalidate_oms_constraints_&&start_date..sql
