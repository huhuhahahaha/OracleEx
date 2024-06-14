SELECT * FROM INFO;
SELECT * FROM AUTH;

--�̳� ����
SELECT * 
FROM INFO INNER JOIN AUTH
ON INFO.AUTH_ID = AUTH.AUTH_ID;

SELECT ID,
        INFO.TITEL,
        INFO.CONTENT,
        INFO.AUTH_ID, -- AUTH_ID�� ���ʿ� ������ ���̺�.�÷������� �����������
        AUTH.NAME
FROM INFO
INNER JOIN AUTH
ON info.auth_id = AUTH.AUTH_ID;

-- ���̺� ��Ī ���̱�
SELECT I.ID,
        I.TITLE,
        A.AUTH_ID,
        A.NAME,
        A.JOB
FROM INFO I
INNER JOIN AUTH A
ON I.AUTH_ID = A.AUTH_ID;

-- ������ Ű�� ���ٸ� USING ������ ����� �� ����
SELECT *
FROM INFO I
INNER JOIN AUTH A
USING (AUTH_ID);

----------------------------
-- OUTER ����
-- 1. LEFT OUTER JOIN (OUTER ��������), �������̺��� ������ ��
SELECT * FROM INFO I LEFT OUTER JOIN AUTH A ON I.AUTH_ID = A.AUTH_ID;
-- 2. RIGHT OUTER JOIN
SELECT * FROM INFO I RIGHT OUTER JOIN AUTH A ON I.AUTH_ID = a.auth_id;
-- 3. FULL OUTER JOIN
SELECT * FROM INFO I FULL OUTER JOIN AUTH A ON I.AUTH_ID = A.AUTH_ID;
-- 4. CROSS JOIN(�߸��� ������ ����, ���� ���� ����
SELECT * FROM INFO I CROSS JOIN AUTH A;
--------------------------------------------------
--SELF JOIN (�ϳ��� ���̺��� ������ ������ �Ŵ°��� ����)
--�� ���̺� ������ ����, ���� ���̺�ȿ� ���ᰡ���� Ű�� �ʿ���
SELECT * 
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES E2
ON E.MANAGER_ID = e2.employee_id;


----------------------------------------
-- ����Ŭ ���� : ����Ŭ������ ����� �� �ְ�, ������ ���̺��� FROM �� ���� ���������� WHERE�� ��

-- ����Ŭ �̳�����
SELECT *
FROM INFO I, AUTH A
WHERE I.AUTH_ID = A.AUTH_ID;

-- ����Ŭ ����Ʈ����
SELECT * 
FROM INFO I, AUTH A
WHERE I.AUTH_ID = A.AUTH_ID(+); -- ���̴� ���̺� +����, ���� ���̺��� �Ⱥ���

-- ����Ŭ ����Ʈ����
SELECT *
FROM INFO I, AUTH A
WHERE I.AUTH_ID(+) = A.AUTH_id;

-- ����Ŭ Ǯ�ƿ��� ������ ����
-- ũ�ν������� �߸��� ����(���� ������ �������� �� ��Ÿ��)
SELECT *
FROM INFO I, AUTH A;
-----------------------------------------

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

SELECT * FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
 --  ������ ������ �� �� ����
 SELECT E.EMPLOYEE_ID,
        E.FIRST_NAME,
        d.department_name,
        l.city
 FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
 WHERE EMPLOYEE_ID >= 150;
 -- ����ϰ� �����ϸ� N���̺� 1���̺��� ���̴°� ���帹��
 -- 1�� N�� ����
 SELECT * FROM DEPARTMENTS D LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
 
 