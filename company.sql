-- �μ��� ��� ���̺� ����
CREATE TABLE employee(
    empid NUMBER(3) PRIMARY KEY,   
    empname VARCHAR2(20) NOT NULL, 
    age NUMBER(3),                 
    deptid NUMBER,
    CONSTRAINT EMP_FK FOREIGN KEY(deptid) REFERENCES departmnets(deptid)
);


CREATE TABLE departments(
    deptid NUMBER,                   -- �μ���ȣ
    deptname VARCHAR2(20) NOT NULL,  -- �μ��̸�
    location VARCHAR2(20) NOT NULL,  -- �繫����ġ
    PRIMARY KEY(deptid)
);



-- �μ� �ڷ� �߰�
INSERT INTO departments VALUES (10, '������', '����');
INSERT INTO departments VALUES (20, '�ѹ���', '��õ');

-- ��� �ڷ� �߰�
INSERT INTO employees VALUES (101, '�̰�', 27, 10);
INSERT INTO employees VALUES (102, '���', 28, 20);
INSERT INTO employees VALUES (103, '����', 35, 30);  --�μ� �ڵ� ���� ����

-- �μ� ����
DELETE FROM departments WHERE deptid = 10;

-- �ܷ�Ű ���� ���� ����
ALTER TABLE employees DROP CONSTRAINT EMP_FK;

-- �ڷ� �˻�
SELECT * FROM departments;
SELECT * FROM employees;

DROP TABLE departments;
