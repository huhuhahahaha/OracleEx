-- SEQUENCE(���������� �����ϴ� ��)
-- �ַ� PK�� ����� �� �ֽ��ϴ�.
SELECT * FROM USER_SEQUENCES;

--������ ����( �ܿ�����)
CREATE SEQUENCE DEPTS_SEQ
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 10
    NOCACHE -- ĳ�ÿ� �������� ���� ����
    NOCYCLE; -- �ִ밪�� �������� �� �������� �ʰڴ�
    
-- ����
DROP TABLE DEPTS;
CREATE TABLE DEPTS (
    DEPT_NO NUMBER(2) PRIMARY KEY,
    DEPT_NAME VARCHAR(30)
);

-- ������ ����� 2��
SELECT DEPTS_SEQ.CURRVAL FROM DUAL; --���� ������ Ȯ��( NEXTVAL �� ����Ǿ����)
SELECT DEPTS_SEQ.NEXTVAL FROM DUAL; --���� ������ ������ ��ŭ ����

--������ ����
INSERT INTO DEPTS VALUES(DEPTS_SEQ.NEXTVAL , 'EXAMPLE');

--������ ����
ALTER SEQUENCE DEPTS_SEQ MAXVALUE 1000;
ALTER SEQUENCE DEPTS_SEQ INCREMENT BY 10;

SELECT * FROM DEPTS;

--�������� �̹� ���ǰ� �ִٸ�, DROP�ϸ� �ȵ˴ϴ�.
--���� �������� �ʱ�ȭ �ؾ� �Ѵٸ�?
--�������� �������� -������ ���� �ʱ�ȭ �ΰ�ó�� �� ���� �ֽ��ϴ�
SELECT DEPTS_SEQ.CURRVAL FROM DUAL;

--1. �������� ������ -(���簪-1) �� �ٲ�
ALTER SEQUENCE DEPTS_SEQ INCREMENT BY -49;
--2. ���� �������� ����
SELECT DEPTS_SEQ.NEXTVAL FROM DUAL;
--3.�ٽ� �������� 1�� ����
ALTER SEQUENCE DEPTS_SEQ INCREMENT BY 1;

------------------------------
--������ ����( ���߿� ���̺��� �����Ҷ� �����Ͱ� ��û ���ٸ� PK�� ������ �����)
--���ڿ� PK (�⵵��-�Ϸù�ȣ)
CREATE TABLE DEPTS2 (
    DEPT_NO VARCHAR2(20) PRIMARY KEY,
    DEPT_NAME VARCHAR2(20)
);

INSERT INTO DEPTS2 VALUES ( TO_CHAR(SYSDATE, 'YYYY-MM-') || LPAD(DEPTS_SEQ.NEXTVAL,6,0),'EXAMPLE');
SELECT * FROM DEPTS2;

-- ������ ����
DROP SEQUENCE DEPTS_SEQ;

----------------------------------------------

