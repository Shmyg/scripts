create or replace trigger sysadm.alter_trigger
before alter
on database
declare
begin
if upper(user)='SYSADM' and (ora_dict_obj_type = 'USER') then
raise_application_error(-20010,'you cannot change your own password');
end if;
end;
/
