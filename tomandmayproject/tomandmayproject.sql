-- �� �����ͺ��̽�

-- USER ����
CREATE USER c##tomandmayproject IDENTIFIED BY 12345;

-- ���� ���� �ο�
GRANT CREATE SESSION TO c##tomandmayproject;

-- ���̺�� ���̺� ���� ����
GRANT CREATE TABLE, RESOURCE TO c##tomandmayproject;

-- ���̺� �����̽� �뷮 ����
ALTER USER c##tomandmayproject DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;