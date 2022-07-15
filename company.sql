-- 부서와 사원 테이블 생성
CREATE TABLE employee(
    empid NUMBER(3) PRIMARY KEY,   
    empname VARCHAR2(20) NOT NULL, 
    age NUMBER(3),  
    salary NUMBER,
    deptid NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid) REFERENCES department(deptid)
);


CREATE TABLE department(
    deptid NUMBER,                   -- 부서번호
    deptname VARCHAR2(20) NOT NULL,  -- 부서이름
    location VARCHAR2(20) NOT NULL,  -- 사무실위치
    PRIMARY KEY(deptid)
);



-- 부서 자료 추가
INSERT INTO department VALUES (10, '전산팀', '서울');
INSERT INTO department VALUES (20, '총무팀', '인천');
INSERT INTO department VALUES (30, '기획조정실', '세종');
INSERT INTO department VALUES (40, '영업팀', '광주');

-- 사원 자료 추가
INSERT INTO employee VALUES (101, '이강', 27, 2500000, 10);
INSERT INTO employee VALUES (102, '김산', 28, 2900000, 20);
INSERT INTO employee VALUES (103, '정들', 35, 1700000, 40); 
INSERT INTO employee VALUES (104, '정들', 35, 3000000, 50);  -- 부서코드 없어서 오류

-- 부서 삭제
DELETE FROM department WHERE deptid = 10;

-- 외래키 제약 조건 삭제
ALTER TABLE department DROP CONSTRAINT EMP_FK;

-- 테이블 삭제
DROP TABLE department CASCADE CONSTRAINTS;
DROP TABLE employee;

SELECT * FROM department;
SELECT * FROM employee;

COMMIT;
