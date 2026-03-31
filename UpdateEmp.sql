
Copy
Copied to ClipboardError: Could not Copy
sqlplus -l system/XXXX@localhost/xepdb1
At the SQL> prompt, enter the following statements (you can choose a different username, if you like):

Copy
Copied to ClipboardError: Could not Copy
define USERNAME = demopython

create user &USERNAME identified by &USERNAME;

alter user &USERNAME
    default tablespace users
    temporary tablespace temp
    quota unlimited on users;

grant create session,
    create view,
    create sequence,
    create procedure,
    create table,
    create trigger,
    create type,
    create materialized view
    to &USERNAME;
Still in SQL*Plus, set a password for your new user. Replace the XXXX with a valid password and run:

Copy
Copied to ClipboardError: Could not Copy
alter user &USERNAME identified by XXXX;
Finally, exit SQL*Plus

Copy
Copied to ClipboardError: Could not Copy
quit
3. Install Python