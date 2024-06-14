SELECT * FROM INFO;
SELECT * FROM AUTH;

--이너 조인
SELECT * 
FROM INFO INNER JOIN AUTH
ON INFO.AUTH_ID = AUTH.AUTH_ID;

SELECT ID,
        INFO.TITEL,
        INFO.CONTENT,
        INFO.AUTH_ID, -- AUTH_ID는 양쪽에 다있음 테이블.컬럼명으로 기입해줘야함
        AUTH.NAME
FROM INFO
INNER JOIN AUTH
ON info.auth_id = AUTH.AUTH_ID;

-- 테이블에 별칭 붙이기
SELECT I.ID,
        I.TITLE,
        A.AUTH_ID,
        A.NAME,
        A.JOB
FROM INFO I
INNER JOIN AUTH A
ON I.AUTH_ID = A.AUTH_ID;

-- 연결할 키가 같다면 USING 구문을 사용할 수 있음
SELECT *
FROM INFO I
INNER JOIN AUTH A
USING (AUTH_ID);

----------------------------
-- OUTER 조인
-- 1. LEFT OUTER JOIN (OUTER 생략가능), 왼쪽테이블이 기준이 됨
SELECT * FROM INFO I LEFT OUTER JOIN AUTH A ON I.AUTH_ID = A.AUTH_ID;
-- 2. RIGHT OUTER JOIN
SELECT * FROM INFO I RIGHT OUTER JOIN AUTH A ON I.AUTH_ID = a.auth_id;
-- 3. FULL OUTER JOIN
SELECT * FROM INFO I FULL OUTER JOIN AUTH A ON I.AUTH_ID = A.AUTH_ID;
-- 4. CROSS JOIN(잘못된 조인의 형태, 실제 쓸일 없음
SELECT * FROM INFO I CROSS JOIN AUTH A;
--------------------------------------------------
--SELF JOIN (하나의 테이블을 가지고 조인을 거는것을 말함)
--내 테이블에 내것을 붙임, 조건 테이블안에 연결가능한 키가 필요함
SELECT * 
FROM EMPLOYEES E
LEFT JOIN EMPLOYEES E2
ON E.MANAGER_ID = e2.employee_id;


----------------------------------------
-- 오라클 조인 : 오라클에서만 사용할 수 있고, 조인할 테이블을 FROM 에 쓰고 조인조건을 WHERE에 씀

-- 오라클 이너조인
SELECT *
FROM INFO I, AUTH A
WHERE I.AUTH_ID = A.AUTH_ID;

-- 오라클 레프트조인
SELECT * 
FROM INFO I, AUTH A
WHERE I.AUTH_ID = A.AUTH_ID(+); -- 붙이는 테이블에 +붙임, 기준 테이블에는 안붙임

-- 오라클 라이트조인
SELECT *
FROM INFO I, AUTH A
WHERE I.AUTH_ID(+) = A.AUTH_id;

-- 오라클 풀아우터 조인은 없음
-- 크로스조인은 잘못된 조인(조인 조건을 안적었을 때 나타남)
SELECT *
FROM INFO I, AUTH A;
-----------------------------------------

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

SELECT * FROM EMPLOYEES E INNER JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;
 --  조인은 여러번 할 수 있음
 SELECT E.EMPLOYEE_ID,
        E.FIRST_NAME,
        d.department_name,
        l.city
 FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
 LEFT JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
 WHERE EMPLOYEE_ID >= 150;
 -- 평범하게 생각하면 N테이블에 1테이블을 붙이는게 가장많다
 -- 1에 N을 붙임
 SELECT * FROM DEPARTMENTS D LEFT JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
 
 