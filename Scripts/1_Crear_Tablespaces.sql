create tablespace huerta_data
       datafile 'C:\app\Garita\oradata\dbHuerta\huerta_data.dbf'
       size 10M
       reuse
       autoextend on
       next 512K
       maxsize 200M;
       
create tablespace huerta_ind
       datafile 'C:\app\Garita\oradata\dbHuerta\huerta_ind.dbf'
       size 10M
       reuse
       autoextend on
       next 512K
       maxsize 200M;
