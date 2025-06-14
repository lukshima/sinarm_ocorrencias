alter session set "_ORACLE_SCRIPT" = TRUE;

CREATE USER USER_LAB IDENTIFIED BY LAB123
QUOTA UNLIMITED ON USERS;

GRANT CONNECT, RESOURCE TO USER_LAB;

CREATE USER AUDITORIA IDENTIFIED BY AUD123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS;
    
GRANT CONNECT, RESOURCE TO AUDITORIA;
