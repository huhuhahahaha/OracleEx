-- 제약 조건(칼럼에 대한 데이터 수정, 삭제, 삽입 등 이상을 방지하기 위한 조건

-- NOT NULL, UNIQUE KEY, PRIMARY KEY, FOREIGN KEY, CHECK

--1. PRIMARY KEY : 테이블 고유키, 중복 불가, NULL 불가, 테이블에서 단 한개
--2. FOREIGN KEY : 참조하는 테이블의 PK를 넣어놓은 키, 중복 가능, NULL 가능
--3. NOT NULL : NULL 허용불가
--4. UNIQUE KEY : 중복 불가, NULL은 가능
--5. CHECK : 칼럼에 대한 데이터 제한

DROP TABLE DEPTS;

--1. '열'레벨의 제약조건
CREATE TABLE DEPTS(
    DEPT_NO NUMBER(2)       CONSTRAINT DEPTS_DEPT_NO_PK PRIMARY KEY,
    DEPT_NAME VARCHAR2(30)  CONSTRAINT DEPTS_DEPT_NAME_NN NOT NULL,
    DEPT_DATE DATE          DEFAULT SYSDATE, --제약조건은 아님(칼럼의 기본값을 지정)
    DEPT_PHONE VARCHAR2(30) CONSTRAINT DEPTS_DEPT_PHONE_UK UNIQUE,
    DEPT_GENDER CHAR(1)     CONSTRAINT DEPTS_DEPT_GENDER_CK CHECK(DEPT_GENDER IN ('F','M')),
    LOCA_ID NUMBER(4)       CONSTRAINT DEPTS_LOCA_ID_FK REFERENCES LOCATIONS(LOCATION_ID)  
);

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER,LOCA_ID) 
VALUES(1,NULL,'0101111','F',1700); --NOT NULL 제약위배

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER,LOCA_ID) 
VALUES(1,'HONG','0101111','X',1700); -- CHECK 제약 위배

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER,LOCA_ID) 
VALUES(1,'HONG','0101111','F',100); --LOCATIONS에 100이 없다, 참조무결성 위배

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER,LOCA_ID) 
VALUES(1,'HONG','0101111','F',1700); --성공

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER,LOCA_ID) 
VALUES(2,'HONG','0101111','F',1700); -- PK는 달라졌지만 UNIQUE 제약 위배
-------------------------------------
-- 2. 테이블 레벨의 제약조건
DROP TABLE DEPTS;
CREATE TABLE DEPTS (
    DEPT_NO NUMBER(2),
    DEPT_NAME VARCHAR2(30) NOT NULL, --NOT NULL은 열레벨 정의
    DEPT_DATE DATE DEFAULT SYSDATE,
    DEPT_PHONE VARCHAR2(30),
    DEPT_GENDER CHAR(1),
    LOCA_ID NUMBER(4),
    CONSTRAINT DEPT_DEPT_NO_PK PRIMARY KEY(DEPT_NO,/*DEPT_NAME*/), --()안에는 칼럼명 , 슈퍼키는 테이블레벨로 지정 가능함
    CONSTRAINT DEPT_DEPT_PHONE_UK UNIQUE (DEPT_PHONE),
    CONSTRAINT DEPT_DEPT_GENDER_CK CHECK (DEPT_GENDER IN ('F','M')),
    CONSTRAINT DEPT_LOCA_ID_FK FOREIGN KEY (LOCA_ID) REFERENCES LOCATIONS(LOCATION_ID)
);
DROP TABLE DEPTS;
-------------------------
--ALTER로 제약조건 추가
CREATE TABLE DEPTS (
    DEPT_NO NUMBER(2),
    DEPT_NAME VARCHAR2(30) , --NOT NULL은 열레벨 정의
    DEPT_DATE DATE DEFAULT SYSDATE,
    DEPT_PHONE VARCHAR2(30),
    DEPT_GENDER CHAR(1),
    LOCA_ID NUMBER(4)
);
-- PK추가
ALTER TABLE DEPTS ADD CONSTRAINT DEPT_DEPT_NO_PK PRIMARY KEY(DEPT_NO);
--NOT NULL은 열 변경(MODIFY)로 추가합니다.
ALTER TABLE DEPTS MODIFY DEPT_NAME VARCHAR2(30) NOT NULL;
--UNIQUE추가
ALTER TABLE DEPTS ADD CONSTRAINT DEPT_DEPT_PHONE_UK UNIQUE (DEPT_PHONE);
--FK 추가
ALTER TABLE DEPTS ADD CONSTRAINT DEPT_LOCA_ID_FK FOREIGN KEY(LOCA_ID) REFERENCES LOCATIONS(LOCATION_ID);
--CHECK 추가
ALTER TABLE DEPTS ADD CONSTRAINT DEPT_DEPT_GENDER_CK CHECK(DEPT_GENDER IN ('F','M'));

--제약 조건 삭제
ALTER TABLE DEPTS DROP CONSTRAINT DEPT_DEPT_GENDER_CK;
--
DROP TABLE DEPTS;