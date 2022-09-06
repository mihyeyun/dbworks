-- dbcp 테스트용 table 생성
CREATE TABLE dbcp_test(
    name VARCHAR2(20) NOT NULL,
    email VARCHAR2(30) PRIMARY KEY
);

INSERT INTO dbcp_test VALUES ('윤미혜', 'cloud@test.com');

SELECT * FROM dbcp_test;
DELETE FROM dbcp_test;

ROLLBACK;   -- 커밋 전에 복원 가능
COMMIT;