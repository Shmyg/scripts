/*
|| Used to disable referential and unique constraints
|| 
|| $Log: disable_ref_constraints.sql,v $
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

SPOOL disable_oms_constraints_&&start_date..sql

SELECT	'alter table oms.' || table_name ||
	' disable constraint ' || constraint_name || ';'
FROM	dba_constraints
WHERE	owner = 'OMS'
AND	constraint_type IN ( 'R', 'U' )
AND	status = 'ENABLED';

SPOOL OFF

START	disable_oms_constraints_&&start_date..sql

!rm disable_oms_constraints_&&start_date..sql

SET PAGESIZE 50
SET TERMOUT ON
