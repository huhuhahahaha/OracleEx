SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM JOBS;

-- Ư�� �÷� Ȯ���غ���
-- ���ڿ� ��¥�� ���ʿ�, ���ڴ� �����ʿ� ǥ�õ˴ϴ�
SELECT FIRST_NAME, HIRE_DATE, EMAIL, SALARY FROM EMPLOYEES;

-- �÷����ڸ������� ���� �Ǵ� ��¥�� ������ �˴ϴ�.
 SELECT FIRST_NAME, SALARY, SALARY + SALARY * 0.1 FROM EMPLOYEES;
 
-- NULL�� 0�̳� ������� �ٸ�, ������ ������
-- PK�� EMPLOYEE_ID, FK�� DEPARTMENT_ID
-- �÷��� �̸� �ٲٱ�(���� ����), AS�� ������ ���������� ����


