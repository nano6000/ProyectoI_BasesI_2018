create user huerta
       identified by huerta
       default tablespace Huerta_data
       quota 10M on Huerta_data
       temporary tablespace temp
       quota 5M on system;
     
grant connect to huerta;
grant resource to huerta;

grant create session to huerta;
grant create any view to huerta;
grant create procedure to huerta;
grant create any table to huerta;
grant create any sequence to huerta;
grant create public synonym to huerta;
