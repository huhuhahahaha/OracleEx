-- 집합연산자
/* 
UNION = 합집합
UNION ALL = 중복까지
INTERSECT = 교집합
MINUS = 차집함
칼럼개수가 일치해야 집합연산자 사용가능
*/
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '04%'
UNION
SELECT FIRST_NAME, HIRE_DATE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID =20;
---------------------
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '04%'
UNION ALL
SELECT FIRST_NAME, HIRE_DATE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID =20;
------------------------------
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '04%'
INTERSECT
SELECT FIRST_NAME, HIRE_DATE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID =20;
-----------------------
SELECT FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE LIKE '04%'
MINUS
SELECT FIRST_NAME, HIRE_DATE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID =20;
----
-- 집합연산자는 DUAL같은 가상 데이터를 만들어서 합칠수도 있습니다
SELECT 200 AS 번호, 'HONG' AS 성, '서울시'AS 지역 FROM DUAL
UNION ALL
SELECT 300, 'LEE', '경기도' FROM DUAL
UNION ALL
SELECT EMPLOYEE_ID, LAST_NAME, '서울시' FROM EMPLOYEES;

--------------------------
-- 분석함수
-- 분석함수 OVER(정렬방법)

SELECT FIRST_NAME, SALARY,
       RANK() OVER(ORDER BY SALARY DESC) AS 중복순서계산,
       DENSE_RANK() OVER(ORDER BY SALARY DESC) AS 중복없는등수,
       ROW_NUMBER() OVER(ORDER BY SALARY DESC) AS 일련번호,
       ROWNUM AS 조회가된순서
       --ROWNUM 은 ORDER시킬때 결과가 바뀝니다
FROM EMPLOYEES;
SELECT ROWNUM,
       FIRST_NAME,
       SALARY
FROM EMPLOYEES
ORDER BY SALARY DESC;