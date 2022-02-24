-- DML

-- INSERT
INSERT INTO dept (deptno, dname, loc)
values (50, '인사부', '서울');       -- tx 시작 됨

SELECT * FROM DEPT;      -- 검색하면 나에게는 보이지만 원본 테이블에는 반영되지 않음

ROLLBACK;       -- 반영취소, tx 종료

SELECT * FROM DEPT;      -- 복구된 것을 확인

INSERT INTO dept (deptno, dname, loc)
values (50, '인사부', '서울');       -- tx 시작 됨

INSERT INTO dept (deptno, dname, loc)
values (60, '개발부', '경기');       -- 하나의 tx로 인식 됨

SELECT * FROM DEPT;     -- 두 개의 행이 삽입된 것이 확인 됨(실제로는 아님)

ROLLBACK;       -- 반영취소, tx 종료

SELECT * FROM DEPT;      -- 복구된 것을 확인

-- 1. 컬럼 이름 명시
INSERT INTO dept(loc, dname, deptno)    -- 컬럼의 순서 변경
VALUES ('서울', '인사부', 50);           -- 위의 순서에 맞춰서 작성   -- tx 시작

SELECT * FROM DEPT;

INSERT INTO dept(dname, loc, deptno)    -- 컬럼의 순서 변경
VALUES ('개발부', '경기', 60);           -- 위의 순서에 맞춰서 작성    -- tx 시작

SELECT * FROM DEPT;

COMMIT;     -- 커밋 => tx반영, tx종료

ROLLBACK;       

SELECT * FROM DEPT;     -- 이미 tx가 종료되었기 때문에, Rollback 하여도 반영되지않음

INSERT INTO dept
VALUES (70, 'aa', 'bb');    -- tx 시작

ROLLBACK;     -- tx 종료

INSERT INTO dept
VALUES (70, 'aa', 'bb');    -- tx 시작

COMMIT;       -- tx 종료

-- 트랙잭션
-- 70 insert 명령 : tx시작
-- 30 삭제
-- 40 부서이름 aa 변경
-- rollback;        -- tx시작 시점부터 모두 복구

-- 2. 컬럼 이름 생략
INSERT INTO DEPT
VALUES (60, '인사', '경기');

COMMIT;

SELECT * FROM DEPT;

-- 3. NULL값 INSERT
-- 3-1 묵시적 NULL 값 INSERT
INSERT INTO DEPT(deptno, dname)
VALUES (70, '인사');

SELECT * FROM DEPT;

INSERT INTO DEPT( dname, loc)
VALUES ('인사', '서울');        -- err: deptno가 PK로, null값을 저장할 수 없기 때문

-- 3-2 명시적 NULL 값 INSERT : null, ''
INSERT INTO DEPT(deptno, dname, loc)
VALUES( 80, '인사', null);        -- null 사용

INSERT INTO DEPT(deptno, dname, loc)
VALUES( 90, '인사', '');          -- ''사용

INSERT INTO DEPT(deptno, dname, loc)
VALUES( 95, '인사', ' ');          -- (주의)''에 공백넣을경우 문자열로 처리

SELECT * FROM dept;

ROLLBACK;

-- 1. 5번, NULL, NULL INSERT 묵시적 INSERT
INSERT INTO DEPT(deptno)
VALUES (5);

-- 2. 6번, NULL, '서울'로 명시적 INSERT
INSERT INTO DEPT(deptno, dname, loc)
VALUES (6, null, '서울');

-- 3. 7번, NULL, '서울'로 묵시적 INSERT
INSERT INTO DEPT(deptno, loc)
VALUES (7, '서울');

SELECT * FROM dept;


-- EMP 테이블에 INSERT
--EMPNO       NUMBER(4) => 4자리 숫자  PK:기본키
--ENAME
--JOB
--MGR         NUMBER(4) => 4자리 숫자
--HIREDATE    DATE
--SAL         NUMBER(7,2) => 7자리 숫자, 소수 둘째자리까지
--COMM        NUMBER(7,2) => 7자리 숫자, 소수 둘째자리까지
--DEPTNO      NUMBER(2) => 2자리 숫자     FK: 외래키 => DEPT테이블에 있는 부서만 가능

-- 4. 9000, 'scott', '연구원', 7839, sysdate, 5000, null, 10을 EMP에 INSERT
INSERT INTO EMP
VALUES (9000, 'scott', '연구원', 7839, sysdate, 5000, null, 10); 

INSERT INTO EMP
VALUES (9001, user, '연구원', 7839, sysdate, 5000, null, 10); 
               -- user로 변경시 사용자 이름인 'SCOTT'이 자동으로 들어감
               -- USER: 사용자 계정(스키마)
               
INSERT INTO EMP
VALUES (9002, user, '연구원', 7839, sysdate, 5000, null, 60);      
                                                         -- ERR : FK 제약조건 위반
                                                         
INSERT INTO EMP
VALUES (9002, user, '연구원', 7839, sysdate, 5000, null, 40);                                                            

               
INSERT INTO EMP
VALUES (9002, user, '연구원', 7839, sysdate, 40);     
        -- ERR: 충분한 개수의 값을 넣어주지 않음
        
INSERT INTO EMP(empno, ename, job, mgr, hiredate, deptno) -- 행을 명시
VALUES (9002, user, '연구원', 7839, sysdate, 40);            

SELECT *
FROM EMP
WHERE ename = 'scott';

-- TABLE 생성
CREATE TABLE aa
AS 
SELECT * From dept;

CREATE TABLE MYDEPT
AS
SELECT * FROM DEPT
WHERE 1 = 2;        -- 레코드가 없는채로 컬럼명만 복사

ROLLBACK;       -- 테이블 생성은 tx가 아니기때문에 롤백해도 효과 없음

-- 다중 INSERT
-- DEPT테이블 모든 데이터를 한번에 MYDEPT에 INSERT
INSERT INTO MYDEPT
SELECT deptno, dname, loc
FROM DEPT;

COMMIT;


INSERT INTO MYDEPT
SELECT deptno, dname        -- 컬럼의 개수가 안맞는 경우 
FROM DEPT;

-- 다중 테이블 다중행 INSERT

-- MYEMP_HIRE테이블 생성
CREATE TABLE MYEMP_HIRE
AS
SELECT empno, ename, hiredate, sal
FROM EMP
WHERE 1=2;

-- MYEMP_MGR테이블 생성
CREATE TABLE MYEMP_MGR
AS
SELECT empno, ename, mgr
FROM EMP
WHERE 1=2;

-- 데이터 삽입
INSERT ALL
    INTO MYEMP_HIRE VALUES (empno, ename, hiredate, sal)
    INTO MYEMP_MGR  VALUES (empno, ename, mgr)
SELECT empno, ename, hiredate, sal, mgr
FROM EMP;

rollback;

INSERT ALL
    INTO MYEMP_HIRE VALUES (empno, ename, hiredate, sal)
    INTO MYEMP_MGR  VALUES (empno, ename, mgr)
SELECT *        -- *을 사용해도 무방
FROM EMP;


-- MYEMP_HIRE2테이블 생성
CREATE TABLE MYEMP_HIRE2
AS
SELECT empno, ename, hiredate, sal
FROM EMP
WHERE 1=2;

-- MYEMP_MGR2테이블 생성
CREATE TABLE MYEMP_MGR2
AS
SELECT empno, ename, mgr
FROM EMP
WHERE 1=2;

-- 조건식을 사용해서 다중행 INSERT
INSERT ALL
    WHEN sal > 3000 THEN
        INTO MYEMP_HIRE2 VALUES (empno, ename, hiredate, sal)
    WHEN mgr = 7698 THEN
        INTO MYEMP_MGR2  VALUES (empno, ename, mgr)
SELECT empno, ename, hiredate, sal, mgr
FROM EMP;

-- 월급이 4000 이고 MRG이 7698인 사원이 있다면 
-- INSERT ALL의 경우 두개의 테이블 모두에 들어가지만
-- INSERT FIRST의 경우 앞의 테이블에만 들어가게 된다.
INSERT FIRST
    WHEN sal > 3000 THEN
        INTO MYEMP_HIRE2 VALUES (empno, ename, hiredate, sal)
    WHEN mgr = 7698 THEN
        INTO MYEMP_MGR2  VALUES (empno, ename, mgr)
SELECT empno, ename, hiredate, sal, mgr
FROM EMP;



---------------------------------
------ UPDATE -------------------
---------------------------------

-- 수정: KING의 sal 5000 => 1로 UPDATE
UPDATE EMP 
SET sal = 1;    -- 여기서 끊을경우 모든 레코드의 sal이 1로 변경 됨

UPDATE EMP
SET sal = 1
WHERE ename = 'KING';

ROLLBACK;

-- 1. DEPT에 50, 개발, 서울 INSERT
INSERT INTO DEPT
VALUES (50, '개발', '서울');

SELECT * FROM DEPT;

COMMIT;

-- 2. DEPT에서 50번 부서를 영업, 경기로 UPDATE
UPDATE DEPT 
SET dname = '영업', loc = '경기'
WHERE deptno = 50;

SELECT * FROM DEPT;

COMMIT;

3. EMP에서 직업이 SALSEMAN인 사원의 COMM을 모두 1000으로 수정
UPDATE EMP
SET comm = 1000
WHERE job = 'SALESMAN';

SELECT * FROM EMP;

ROLLBACK;

--- UPDATE 문에서의 서브쿼리
-- MTDEPT테이블의 부서번호가 60인 사원의 부서명을
-- DEPT테이블의 부서번호가 10인 부서의 부서명으로 수정하고
-- 부서위치는 DEPT테이블의 부서번호가 20인 부서위치로 수정
UPDATE MYDEPT
SET dname = (   SELECT dname
                FROM DEPT
                WHERE deptno = 10),
    loc = ( SELECT loc
            FROM DEPT
            WHERE deptno = 20)
WHERE deptno = 60;


-- 4. EMP에 사원번호 9000, 이름 SCOTT, 입사일 오늘날짜, 부서번호 10 INSERT
INSERT INTO EMP (empno, ename, hiredate, deptno)
VALUES  ('9000', 'scott', sysdate, 10);

-- SELECT 확인
SELECT * FROM EMP;

-- SAL 100, JOB SALESMAN, COMM 150으로 UPDATE
UPDATE EMP
SET sal = 100, job = 'SALESMAN', comm = 150
WHERE ename = 'scott';

-- SELECT 확인
SELECT * FROM EMP;

-- ROLLBACK
ROLLBACK;

-----------------------------------------------
SELECT * FROM EMP;
SELECT * FROM scott.EMP;


---------------------------------
------ DELETE -------------------
---------------------------------

DELETE FROM dept;   -- err: emp테이블에서 deptno를 참조하고 있기때문에 삭제 불가
DELETE FROM EMP;    -- 조건이 없다면 모든 행 삭제
ROLLBACK;

DELETE FROM DEPT
WHERE deptno = 50;

SELECT *
FROM DEPT;

COMMIT;

-- 1. emp테이블에서 comm 이 null인 사원 삭제 후 롤백
DELETE FROM EMP
WHERE comm IS NULL;

ROLLBACK;

-- 2. DEPT테이블에서 20번 부서의 지역과 동일한 지역의 부서를 삭제
DELETE FROM DEPT
WHERE loc = (   SELECT loc
                FROM DEPT
                WHERE deptno = 20)
AND deptno != 20;       -- 부서번호 20번 제외

ROLLBACK;


---------------------------------
------ MERGE --------------------
---------------------------------

CREATE TABLE pt_01
(   판매번호    VARCHAR2(8),
    제품번호    NUMBER,
    수량      NUMBER,
    금액      NUMBER);
    
CREATE TABLE pt_02
(   판매번호    VARCHAR2(8),
    제품번호    NUMBER,
    수량      NUMBER,
    금액      NUMBER);
    
CREATE TABLE p_total
(   판매번호    VARCHAR2(8),
    제품번호    NUMBER,
    수량      NUMBER,
    금액      NUMBER);
    
INSERT INTO pt_01 VALUES( '20170101', 1000, 10, 500);   
INSERT INTO pt_01 VALUES( '20170102', 1001, 10, 400);   
INSERT INTO pt_01 VALUES( '20170103', 1002, 10, 300);   

INSERT INTO pt_02 VALUES( '20170201', 1003, 5, 500);   
INSERT INTO pt_02 VALUES( '20170202', 1004, 5, 400);   
INSERT INTO pt_02 VALUES( '20170203', 1005, 5, 300);   

COMMIT;

-- pt_01 병합
MERGE INTO p_total total
USING pt_01 p01
ON( total.판매번호 = p01.판매번호)
WHEN MATCHED THEN
    UPDATE SET total.제품번호 = p01.제품번호
WHEN NOT MATCHED THEN
    INSERT VALUES (p01.판매번호, p01.제품번호, p01.수량, p01.금액);
    
-- pt_02 병합
MERGE INTO p_total total
USING pt_02 p02
ON( total.판매번호 = p02.판매번호)
WHEN MATCHED THEN
    UPDATE SET total.제품번호 = p02.제품번호
WHEN NOT MATCHED THEN
    INSERT VALUES (p02.판매번호, p02.제품번호, p02.수량, p02.금액);
    
    
-- 트랜젝션

-- DEPT 50, aa, aa INSERT           - tx 시작
INSERT INTO DEPT
VALUES (50, 'aa', 'aa');

-- DEPT 40번 주소 aa로 update
UPDATE DEPT
SET loc = 'aa'
WHERE deptno = 40;

-- 확인
SELECT * FROM DEPT;

-- ROLLBACK                     - tx 종료
ROLLBACK;

-- 확인
SELECT * FROM DEPT;


---- lock
UPDATE DEPT
SET loc = '부산'
WHERE deptno = 40;
-- ROLLBACK이나 COMMIT 하기 전에는
-- 다른 사용자가 접근 불가

ROLLBACK;

