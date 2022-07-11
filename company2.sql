CREATE TABLE employees(
    empid NUMBER(3) PRIMARY KEY,
    empname VARCHAR2(20) NOT NULL,
    age NUMBER(3),
    deptid NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid)
    REFERENCES departments (deptid)
);

INSERT INTO employees VALUES (101, '이강', 27, 10);
INSERT INTO employees VALUES (102, '김산', 28, 20);
INSERT INTO employees VALUES (103, '정들', 35, 30);  --부서 코드 없음 오류