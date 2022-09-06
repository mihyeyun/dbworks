-- 새 데이터베이스

-- USER 생성
CREATE USER c##tomandmayproject IDENTIFIED BY 12345;

-- 세션 권한 부여
GRANT CREATE SESSION TO c##tomandmayproject;

-- 테이블과 테이블 공간 생성
GRANT CREATE TABLE, RESOURCE TO c##tomandmayproject;

-- 테이블 스페이스 용량 설정
ALTER USER c##tomandmayproject DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;