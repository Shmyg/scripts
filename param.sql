/*
|| Script to see init.ora parameter
|| $Id: param.sql,v 1.1 2004/10/10 08:38:21 serge Exp $
*/

DECLARE

	v_retcode	PLS_INTEGER;
	v_num_value	PLS_INTEGER;
	v_str_value	VARCHAR2(100);

BEGIN

	v_retcode := DBMS_UTILITY.GET_PARAMETER_VALUE
			(
			'&1',
			v_num_value,
			v_str_value
			);
	DBMS_OUTPUT.PUT_LINE( 'Number value is: ' || v_num_value );
	DBMS_OUTPUT.PUT_LINE( 'String value is: ' || v_str_value );

END;
/
