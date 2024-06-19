--����
--DBA�� ����

----------------------------------------
--����� ���� ����
--CREATE USER ������
--IDENTIFIED BY ���;   �� ����

--���Ѻο�
--GRANT �����Ǹ�Ī
--TO ���ѹ�������
--WITH ADMIN OPTION(�ý��۱����� �ο��ϸ鼭 �� ������ 3�ڿ��Ե� �ο��� �� �ְ���, ���� �� �Ⱦ�)

------------------------------------------------------
--SYS�������� �غ���
--���� ���
SELECT * FROM ALL_USERS;
--���� ���� ����
SELECT * FROM USER_SYS_PRIVS;
--��������
CREATE USER USER01
IDENTIFIED BY USER01;
--���Ѻο�(����,���̺� �� ������ ���ν����� ����,��)
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE VIEW, CREATE PROCEDURE
TO USER01;
--���̺����̽�(�����͸� �����ϴ� �������� ����)�� ��������ߵ�
ALTER USER USER01 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

--���� ȸ��
REVOKE CREATE SESSION FROM USER01; --���ӱ����� ȸ����
--���� ����
DROP USER USER01;
-----------------------------------

--ROLE : ������ �����̶�� �����ϸ� ��
--����Ŭ�� ����Ʈ�� �����ϴ� CONNECT, RESOURCE, DBA���� �̿��ϸ� 
--���� ����ڿ��� ������ �ο��� �� ����

CREATE USER USER01 IDENTIFIED BY USER01;

GRANT CONNECT, RESOURCE TO USER01; -- ���ӱ��Ѱ�, ���߱����� �ѹ��� ����

ALTER USER USER01 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

DROP USER USER01;