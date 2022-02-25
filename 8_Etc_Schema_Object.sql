------ 8. 기타 스키마 객체

---- 1) 뷰
-- 부서 번호가 20인 사원의 사원정보와 부서정보를 검색
-- Oracle 조인
SELECT empno, ename, e.deptno, dname 
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND e.deptno = 20;

-- ANSI 조인
SELECT empno, ename, deptno, dname 
FROM emp
JOIN dept
USING (deptno)
WHERE deptno = 20;

-- 위의 결과를 view로 생성
CREATE VIEW emp_view
AS
SELECT empno, ename, e.deptno, dname 
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND e.deptno = 20;          -- ERR: 권한 부족
-- scott 계정이 뷰 생성을 위한 권한을 부여받지 못했기때문에 에러 발생

-------- sys 계정에서 view 생성 권한 부여 ------------
-- view 다시 생성
CREATE VIEW emp_view
AS
SELECT empno, ename, e.deptno, dname 
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno
AND e.deptno = 20;                  -- 문제 없이 생성

DESC emp_view;
SELECT * FROM emp_view;

-- 문제
-- emp_view2 : emp테이블에서 sal을 뺀 나머지 칼럼으로 뷰 생성
CREATE VIEW emp_view2
AS
SELECT empno, ename, job, mgr, hiredate, comm, deptno
FROM emp;

DESC emp_view2;
SELECT * FROM emp_view2;

-- 뷰 수정
CREATE OR REPLACE VIEW emp_view2
AS
SELECT empno, ename, job, mgr, comm, deptno
FROM emp;

SELECT * FROM emp_view2;

-- 단순 뷰
CREATE VIEW emp_view3 ( 사원번호, 이름, 월급)
AS
SELECT empno, ename, sal
FROM emp
WHERE deptno = 20;

DESC emp_view3;

UPDATE emp_view3
SET 이름 = 'aa'
WHERE 사원번호 = 7369;

-- View에서 변경된 것을 확인
SELECT * FROM emp_view3;

-- 원본 Table 확인
SELECT * FROM emp;      -- 원본 테이블도 변경 된 것을 확인

-- 다시 원래대로 변경
UPDATE emp_view3
SET 이름 = 'SMITH'
WHERE 사원번호 = 7369;


------------------
-- err
CREATE VIEW emp_view4
AS
SELECT deptno, SUM(sal)
FROM emp
GROUP BY deptno;

-- 함수 사용시 별칭 지정
CREATE VIEW emp_view4
AS
SELECT deptno, SUM(sal) 총합
FROM emp
GROUP BY deptno;

select * from emp_view4;

-- EMP_VIEW5 생성
CREATE VIEW emp_view5
AS
SELECT empno, ename, sal, deptno
FROM emp;

SELECT * FROM emp_view5;

-- 10번 부서 사원 삭제
DELETE FROM emp_view5
WHERE deptno = 10;

-- 원본 테이블에서도 삭제 됨
SELECT * FROM EMP;

ROLLBACK;

-------------------------------------------------------
-------------- 2. 시퀀스(Sequence) ---------------------

CREATE SEQUENCE dept_detpno_seq
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 100
    MINVALUE 5
    CYCLE
    NOCACHE;
    
SELECT DEPT_DETPNO_SEQ.nextval    
FROM DUAL;   
-- 처음엔 10 이 출력됨
-- 한번 더 실행하면 20 
-- 실행할때마다 10씩 증가
-- 100까지 증가했다가 
-- 100에서 한번 더 실행하면 CYCLE 조건에 의해 MINVALUE인 5부터 다시 시작
-- 실행할때마다 10씩 증가

------------- 처음부터 다시 시작하고 싶으면 DROP 후 재 생성해야함
DROP SEQUENCE dept_detpno_seq;


-- 다시 생성 후 50번이 출력 될때까지 실행
SELECT DEPT_DETPNO_SEQ.nextval    
FROM DUAL;   

-- 부서 번호 60이 자동으로 생성되서 삽입
INSERT INTO dept
VALUES (DEPT_DETPNO_SEQ.nextval, 'aa', 'aa');


SELECT  DEPT_DETPNO_SEQ.nextval,
        DEPT_DETPNO_SEQ.currval
FROM DUAL;       


CREATE SEQUENCE dept_detpno_seq2
    START WITH 100
    INCREMENT BY -10
    MAXVALUE 150
    MINVALUE 10
    CYCLE
    NOCACHE;
    
SELECT DEPT_DETPNO_SEQ2.nextval
FROM dual;
-- 100에서 시작해 10씩 줄어들어 10까지 출력함
-- 10에서 실행시 150으로 변경되어 다시 10씩 줄어들게 됨


-- sequence 값 확인
select *
from user_sequences
WHERE sequence_name = 'DEPT_DETPNO_SEQ2';

-- 값을 지정하지 않고 시퀀스 생성
CREATE SEQUENCE dept_detpno_seq3;

-- 값 확인
select *
from user_sequences
WHERE sequence_name = 'DEPT_DETPNO_SEQ3';
-- LAST_NUMBER = 1
-- MIN_VALUE = 1
-- MAX_CALUE = 9999999999999999999999999999
-- INCREMENT BY = 1
-- CYCLE = N
-- CACHE_SIZE = 20

-- INCREMENT BY를 10으로, CYCLE을 Y로 변경
ALTER SEQUENCE DEPT_DETPNO_SEQ3
    INCREMENT BY 10
    CYCLE;

-- 변경 된 것을 확인
select *
from user_sequences
WHERE sequence_name = 'DEPT_DETPNO_SEQ3';

-- START WITH값 변경 시도
ALTER SEQUENCE DEPT_DETPNO_SEQ3
    START WITH 5;       -- ERR
    

-- 새로운 테이블 생성    
CREATE TABLE dept06
( deptno    NUMBER(4)   PRIMARY KEY,
  dname     VARCHAR2(15),
  loc       VARCHAR2(15)
);

CREATE SEQUENCE DEPT_DETPNO_SEQ4
    START WITH 10
    INCREMENT BY 10
    NOCYCLE;
    
INSERT INTO dept06
VALUES( DEPT_DETPNO_SEQ4.NEXTVAL, '개발', '서울');
INSERT INTO dept06
VALUES( DEPT_DETPNO_SEQ4.NEXTVAL, '인사', '경기');
INSERT INTO dept06
VALUES( DEPT_DETPNO_SEQ4.NEXTVAL, '관리', '부산');
COMMIT;

SELECT * FROM DEPT06;

DROP SEQUENCE dept_detpno_seq4;