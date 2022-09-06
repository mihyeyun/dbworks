-- �μ����̺�
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


INSERT INTO prac_department VALUES (10, '������', '����');
INSERT INTO prac_department VALUES (20, '�ѹ���', '��õ');
INSERT INTO prac_department VALUES (30, '������', '����', TO_DATE('2018-07-01', 'YYYY-MM-DD'));


UPDATE prac_department SET to_date = SYSDATE;


INSERT INTO prac_employee VALUES (101, '�̰�', 27, 10);
INSERT INTO prac_employee VALUES (102, '���', 28, 20);
INSERT INTO prac_employee VALUES (103, '����', 35, 30); -- �μ��ڵ� ���� (�θ�Ű ����)

SELECT * FROM prac_department;
SELECT * FROM prac_employee;

DELETE FROM prac_department WHERE deptid=20; --prac_employee ���̺��� ���� �ϰ� �����Ƿ� �����Ұ�

--�ܷ�Ű ���� ���� ����
ALTER TABLE prac_employee DROP CONSTRAINT EMP_FK;
-- ���̺���� 
DROP TABLE prac_department CASCADE CONSTRAINTS;