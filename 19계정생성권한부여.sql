--권한
--DBA가 대장

----------------------------------------
--사용자 계정 생성
--CREATE USER 유저명
--IDENTIFIED BY 비번;   의 구문

--권한부여
--GRANT 권한의명칭
--TO 권한받을계정
--WITH ADMIN OPTION(시스템권한을 부여하면서 그 권한을 3자에게도 부여할 수 있게함, 보통 잘 안씀)

------------------------------------------------------
--SYS계정에서 해보자
--유저 목록
SELECT * FROM ALL_USERS;
--현재 유저 권한
SELECT * FROM USER_SYS_PRIVS;
--계정생성
CREATE USER USER01
IDENTIFIED BY USER01;
--권한부여(접속,테이블 뷰 시퀀스 프로시져등 생성,등)
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE VIEW, CREATE PROCEDURE
TO USER01;
--테이블스페이스(데이터를 저장하는 물리적인 공간)를 지정해줘야돼
ALTER USER USER01 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

--권한 회수
REVOKE CREATE SESSION FROM USER01; --접속권한을 회수함
--계정 삭제
DROP USER USER01;
-----------------------------------

--ROLE : 권한의 집합이라고 생각하면 됨
--오라클에 디폴트로 존재하는 CONNECT, RESOURCE, DBA등을 이용하면 
--쉽게 사용자에게 권한을 부여할 수 있음

CREATE USER USER01 IDENTIFIED BY USER01;

GRANT CONNECT, RESOURCE TO USER01; -- 접속권한과, 개발권한을 한번에 다줌

ALTER USER USER01 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

DROP USER USER01;