-- 부서테이블
CREATE TABLE prac_department(
    deptid NUMBER,
    deptname VARCHAR2(20) NOT NULL,
    location VARCHAR2(20) NOT NULL,
    PRIMARY KEY(deptid)
);
ALTER TABLE prac_department ADD to_date DATE;

CREATE TABLE prac_employee(
    empid NUMBER,
    empname VARCHAR2(20) NOT NULL,
    age NUMBER,
    deptid NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid) REFERENCES prac_department(deptid)
);
ALTER TABLE prac_employee ADD CONSTRAINT EMP_FK FOREIGN KEY(deptid) REFERENCES prac_department(deptid);


INSERT INTO prac_department VALUES (10, '전산팀', '서울');
INSERT INTO prac_department VALUES (20, '총무팀', '인천');
INSERT INTO prac_department VALUES (30, '재정팀', '수원', TO_DATE('2018-07-01', 'YYYY-MM-DD'));


UPDATE prac_department SET to_date = SYSDATE;


INSERT INTO prac_employee VALUES (101, '이강', 27, 10);
INSERT INTO prac_employee VALUES (102, '김산', 28, 20);
INSERT INTO prac_employee VALUES (103, '정들', 35, 30); -- 부서코드 없음 (부모키 없음)

SELECT * FROM prac_department;
SELECT * FROM prac_employee;

DELETE FROM prac_department WHERE deptid=20; --prac_employee 테이블이 참조 하고 있으므로 삭제불가

--외래키 제약 조건 삭제
ALTER TABLE prac_employee DROP CONSTRAINT EMP_FK;
-- 테이블삭제 
DROP TABLE prac_department CASCADE CONSTRAINTS;