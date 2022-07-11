CREATE TABLE employees(
    empid NUMBER(3) PRIMARY KEY,
    empname VARCHAR2(20) NOT NULL,
    age NUMBER(3),
    deptid NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid)
    REFERENCES departments (deptid)
);

INSERT INTO employees VALUES (101, '�̰�', 27, 10);
INSERT INTO employees VALUES (102, '���', 28, 20);
INSERT INTO employees VALUES (103, '����', 35, 30);  --�μ� �ڵ� ���� ����