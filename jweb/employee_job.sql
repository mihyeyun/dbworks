-- ���̺� ���� employee
CREATE TABLE employee(
    empid   NUMBER(5) PRIMARY KEY,
    name    VARCHAR2(20) NOT NULL,
    phone   VARCHAR2(15) NOT NULL,
    hiredate DATE
);
ALTER TABLE employee MODIFY(hiredate DATE NOT NULL);

INSERT INTO employee VALUES (101, '��׷�', '010-1234-5678', TO_DATE('2015-08-01', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (102, '���Ѻ�', '010-1234-1234', TO_DATE('2015-08-02', 'YYYY-MM-DD'));
INSERT INTO employee VALUES (103, '�����', '010-1234-7891', TO_DATE('2015-08-03', 'YYYY-MM-DD'));

-- ���̺� ���� job_history
CREATE TABLE job_history(
    jobid   VARCHAR2(10) PRIMARY KEY,
    jobtitle VARCHAR2(20) NOT NULL,
    startdate DATE NOT NULL,
    enddate DATE NOT NULL
);
ALTER TABLE job_history ADD(empid NUMBER(5));
ALTER TABLE job_history ADD CONSTRAINT JH_EMP FOREIGN KEY(empid) REFERENCES employee(empid);

INSERT INTO job_history VALUES ('IT_PROG', '�� ���α׷���', TO_DATE('2018-01-01', 'YYYY-MM-DD'), TO_DATE('2020-12-31', 'YYYY-MM-DD'), 101);
INSERT INTO job_history VALUES ('FI_ACCOUNT', '����������', TO_DATE('2018-02-01', 'YYYY-MM-DD'), TO_DATE('2020-12-31', 'YYYY-MM-DD'), 102);
INSERT INTO job_history VALUES ('HR_REP', '�λ�������', TO_DATE('2018-03-01', 'YYYY-MM-DD'), TO_DATE('2020-12-31', 'YYYY-MM-DD'), 103);

-- ���̺� ��ȸ
SELECT * FROM job_history;
SELECT * FROM employee;

-- 3-1�� '�θ� Ű�� �����ϴ�'
UPDATE job_history SET empid=104 WHERE jobid='HR_REP';

-- 3-2�� '�ڽ� ���ڵ尡 �߰ߵǾ����ϴ�'
DELETE FROM employee WHERE empid=103;
