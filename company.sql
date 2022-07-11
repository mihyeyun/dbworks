-- 부서와 사원 테이블 생성
CREATE TABLE employee(
    empid NUMBER(3) PRIMARY KEY,   
    empname VARCHAR2(20) NOT NULL, 
    age NUMBER(3),                 
    deptid NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid) REFERENCES departmnets(deptid)
);


CREATE TABLE departments(
    deptid NUMBER,                   -- 부서번호
    deptname VARCHAR2(20) NOT NULL,  -- 부서이름
    location VARCHAR2(20) NOT NULL,  -- 사무실위치
    PRIMARY KEY(deptid)
);



-- 부서 자료 추가
INSERT INTO departments VALUES (10, '전산팀', '서울');
INSERT INTO departments VALUES (20, '총무팀', '인천');

-- 사원 자료 추가
INSERT INTO employees VALUES (101, '이강', 27, 10);
INSERT INTO employees VALUES (102, '김산', 28, 20);
INSERT INTO employees VALUES (103, '정들', 35, 30);  --부서 코드 없음 오류

-- 부서 삭제
DELETE FROM departments WHERE deptid = 10;

-- 외래키 제약 조건 삭제
ALTER TABLE employees DROP CONSTRAINT EMP_FK;

-- 자료 검색
SELECT * FROM departments;
SELECT * FROM employees;

DROP TABLE departments;
