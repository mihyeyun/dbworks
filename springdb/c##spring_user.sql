-- New User 만들 때 system에서 작업
-- user - c##spring 생성, 비밀번호 spring

CREATE USER c##spring IDENTIFIED BY spring
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

-- 권한 부여
GRANT CONNECT, DBA TO c##spring;