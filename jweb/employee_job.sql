-- 테이블 생성 employee
CREATE TABLE employee(
    empid   NUMBER(5) PRIMARY KEY,
    name    VARCHAR2(20) NOT NULL,
    phone   VARCHAR2(15) NOT NULL,
    hiredate DATE
);
ALTER TABLE employee MODIFY(hiredate DATE NOT NULL);

INSERT INTO employee VALUES (101, '장그래', '010-1234-5678', TO_DATE('2015-08-01', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (102, '김한비', '010-1234-1234', TO_DATE('2015-08-02', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (103, '손흥민', '010-1234-7891', TO_DATE('2015-08-03', 'YYYY-MM-DD'));

-- 테이블 생성 job_history
CREATE TABLE job_history(
    jobid   VARCHAR2(10) PRIMARY KEY,
    jobtitle VARCHAR2(20) NOT NULL,
    startdate DATE NOT NULL,
    enddate DATE NOT NULL
);
ALTER TABLE job_history ADD(empid NUMBER(5));
ALTER TABLE job_history ADD CONSTRAINT JH_EMP FOREIGN KEY(empid) REFERENCES employee(empid);

INSERT INTO job_history VALUES ('IT_PROG', '웹 프로그래머', TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2020-12-31', 'YYYY-MM-DD'), 101);
INSERT INTO job_history VALUES ('FI_ACCOUNT', '금융전문가', TO_DATE('2018-02-01', 'YYYY-MM-DD'), TO_DATE('2020-12-31', 'YYYY-MM-DD'), 102);
INSERT INTO job_history VALUES ('HR_REP', '인사전문가', TO_DATE('2018-03-01', 'YYYY-MM-DD'), TO_DATE('2020-12-31', 'YYYY-MM-DD'), 103);

-- 테이블 조회
SELECT * FROM job_history;
SELECT * FROM employee;

-- 3-1번 '부모 키가 없습니다'
UPDATE job_history SET empid=104 WHERE jobid='HR_REP';

-- 3-2번 '자식 레코드가 발견되었습니다'
DELETE FROM employee WHERE empid=103;
