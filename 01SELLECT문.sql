
SELECT * FROM EMPLOYEES;
SELECT * FROM departments;
SELECT * FROM JOBS;

--Ư��Į���� ��ȸ�ϱ�
--���ڿ� ��¥�� ���ʿ�, ���ڴ� �����ʿ� ǥ�õ˴ϴ�.
SELECT FIRST_NAME, HIRE_DATE, SALARY FROM EMPLOYEES;

--�÷��� �ڸ������� ���� OR ��¥�� ������ �˴ϴ�.
SELECT FIRST_NAME, SALARY, SALARY + SALARY * 0.1 FROM EMPLOYEES;

--PK: EMPLOYEES ID, FK: DEPARTMENT_ID
SELECT * FROM EMPLOYEES;

--�ٸ��(��Ī) : AS
SELECT FIRST_NAME AS ��Ī, SALARY �޿�, SALARY + SALARY * 0.1 "�����޿�" FROM EMPLOYEES;

--���ڿ� ���� ||
--Ȭ����ǥ �ȿ��� Ȭ����ǥ ���� �ʹٸ� ''
SELECT 'HELLO' || 'WORLD' FROM EMPLOYEES;
SELECT FIRST_NAME || '���� �޿��� ' || SALARY || '$�Դϴ�' AS �޿� FROM EMPLOYEES;

--DISTINCT(�ߺ�����) Ű����: SELECT ������ ����
SELECT DEPARTMENT_ID FROM EMPLOYEES;
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES;

--ROWID (���ڵ尡 ����� ��ġ), ��ROWNUM(��ȸ�� ����)
SELECT EMPLOYEE_ID, FIRST_NAME, ROWID, ROWNUM FROM EMPLOYEES;




























