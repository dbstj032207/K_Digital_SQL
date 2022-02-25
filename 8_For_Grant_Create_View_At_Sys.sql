-- scott 계정 생성
--  패스워드 변경: 
ALTER USER scott IDENTIFIED BY tiger;         

-- 계정 생성: 
CREATE USER scott IDENTIFIED BY tiger;   

-- 권한 부여: 
GRANT connect, resource TO scott;
    /*  권한: 테이블생성 권한(테이블 생성자 scott - INSERT, UPDATE, DELETE, ...권한 부여), ...
        롤(역할): 여러개의 필요한 권한들을 하나의 묶음으로 만들어 활용, 사용자에게 권한대신 롤을 부여
        connect는 권한이 아닌 롤임 (CREATE SESSION 권한이 포함되어있음)
        resource또한 롤임 (테이블 생성, 프로시져 생성, 시퀀드 생성, ...의 권한이있지만, 뷰 생성 권한은 없음)
        */
-- db 접근 및 사용권한 부여

-- USER03 생성
CREATE USER user03 IDENTIFIED BY user03;

-- clerk롤 생성
CREATE ROLE clerk;

-- clerk롤에 CREATE SESSION과 CREATE TABLE 시스템 권한 부여
GRANT CREATE SESSION, CREATE TABLE
TO clerk;

-- clerku에 select 권한 부여
GRANT SELECT 
ON scott.dept
TO clerk;

-- user03에 clerk 롤 부여
GRANT clerk TO user03;


-- scott에 view 생성 권한 부여
GRANT CREATE VIEW
TO scott;




